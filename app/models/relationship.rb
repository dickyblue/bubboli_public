class Relationship < ActiveRecord::Base

  fields = [ :user_id, :child_id, :relation_type_id, :gift_category_ids, :gift_price_range_ids, :status, :accepted_at, :reminders ]
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

  def change_rel_status
    if self.relation_type_id == 1 && self.child.number_of_parents < 2
      self.status = "Confirmed"
      self.accepted_at = Time.now
    end
  end
  
  def is_confirmed_relationship?(user)
    confirmed = self.where(:user_id => user.id, :status => "Confirmed")
    return true if confirmed
  end
  
  def send_reminder
    
    #identify which reminder is being sent
    #send email noticication from here
    calculate_next_due_date
  end
  
  def calculate_next_due_date
    selected_reminders = ReminderOption.all.select {|r| (self.respond_to?(r.name)) && (self.send(r.name.to_sym) == '1') }
    sorted_reminders = selected_reminders.sort_by {|r| r.days } if selected_reminders.present?
    remaining_reminders = sorted_reminders.select {|r| r.days <= self.child.birthday_days} if sorted_reminders.present?
    next_reminder = remaining_reminders.max_by(&:days) if remaining_reminders.present?
    if next_reminder
      due_date = next_reminder.days.days.ago(self.child.next_birthday)
      self.update_attribute(:next_reminder_due_at, due_date)
    end
  end
      
end
