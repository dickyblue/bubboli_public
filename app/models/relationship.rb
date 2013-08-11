class Relationship < ActiveRecord::Base

  extend FriendlyId
  friendly_id :full_name_and_child_name, use: [:slugged, :history]

  fields = [ :user_id, :child_id, :relation_type_id, :gift_category_ids, :gift_price_range_ids, :status, :accepted_at, :reminders]
  fields << ReminderOption.all.map(&:name.to_sym)
  fields = fields.flatten
  store :reminders, accessors: ReminderOption.all.map(&:name.to_sym)

  attr_accessible *fields
  belongs_to  :user
  belongs_to  :child
  belongs_to  :relation_type
  
  has_many    :user_child_cat_prefs
  has_many    :gift_categories, :through => :user_child_cat_prefs
  
  has_many    :user_child_price_prefs
  has_many    :gift_price_ranges, :through => :user_child_price_prefs
  
  validates_uniqueness_of :user_id, :scope => :child_id
  
  before_save :change_rel_status
  before_save :set_new_due_date
  # after_save :set_friend_alert, :on => :create
  after_create :send_friend_alert_email 
  after_create :set_reminders_to_all

  def change_rel_status
    if self.relation_type_id == 1 && self.child.number_of_parents < 2
      self.status = "Confirmed"
      self.accepted_at = Time.now
    end
  end
  
  def is_confirmed_relationship?
    confirmed = self.where(:user_id => user.id, :status => "Confirmed")
    return true if confirmed
  end
  
  def full_name_and_child_name
    "#{self.user.first_name} #{self.user.last_name} #{self.child.first_name} "
  end

  # def send_reminder    
    #identify which reminder is being sent
    #Send email notification from here
  #   set_new_due_date(true)
  # end

  def set_new_due_date(force_update=false)
    date = next_due_date
    if self.reminders_changed? || force_update || self.child_id_changed?
      self.next_reminder_due_at = date
    end
    self.update_attribute(:next_reminder_due_at, date) if force_update && self.next_reminder_due_at_changed?
  end

 # NEED TO MAKE IT SO THAT IT UPDATES ONCE EMAILS ARE SENT.  ALSO NEED TO UPDATE WHEN CHILD BIRTHDATE CHANGES.
  def next_due_date
    begin
      selected_reminders = ReminderOption.all.select {|r| (self.respond_to?(r.name)) && (self.send(r.name.to_sym) == '1') }
      sorted_reminders = selected_reminders.sort_by {|r| r.days} if selected_reminders.present?
      remaining_reminders = sorted_reminders.select {|r| r.days <= self.child.birthday_days} if sorted_reminders.present?
      next_reminder = remaining_reminders.max_by(&:days) if remaining_reminders.present?
      if next_reminder
        due_date= next_reminder.days.days.ago(self.child.next_birthday)
      elsif sorted_reminders.present?
        due_date = calculate_for_next_year(sorted_reminders.max_by(&:days))
      end
      
    rescue 
      nil
    end
  end
  
  def calculate_for_next_year(reminder)
    (self.child.next_birthday + 1.year) - reminder.days
  end
  
  # def set_friend_alert
  #   self.update_column('friend_alert', true)
  # end
  
  def send_friend_alert_email     
    if self.relation_type_id == 1
    else 
      generate_token(:relation_token)
      self.relation_token_sent_at = Time.zone.now
      save!
      FriendAlertMailer.delay.friend_alert(self) if self.child.parents
    end       
  end
  
  def confirm_relationship!
    self.status = "Confirmed"
    # self.relation_token = nil
    save(:validate => false)
  end
  
  def set_reminders_to_all
    self.reminders = {}
    reminder_options = ReminderOption.pluck(:name)
    reminder_options.each{|a| self.reminders[a] = "1"}
    self.next_reminder_due_at = self.next_due_date
    self.save
  end
  
  private
  
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while Relationship.exists?(column => self[column])
    end
  
  
end