class Child < ActiveRecord::Base

  extend FriendlyId
  friendly_id :first_name, use: [:slugged, :history]
  
  attr_accessible :first_name, :gender, :birth_date, :relation_type_ids, :invitations_attributes, :relationships_attributes, :child_images_attributes
  
  validates :first_name, :gender, :birth_date, :presence => true
  
  has_many :child_images, :dependent => :destroy
  has_many :relationships, :dependent => :destroy
  has_many :relation_types, :through => :relationships
  has_many :users, :through => :relationships

  has_many :invitations
  
  has_many  :gift_accessions
  has_many  :gifts, :through => :gift_accessions 
  has_many  :givers, :through => :gift_accessions
  
  accepts_nested_attributes_for :invitations, :relationships #Added relationships to create new relationship when new child is created
  accepts_nested_attributes_for :child_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  before_save :update_reminders
  
  def invitation_token
    invitation.token if invitation
  end
  
  def invitation_token=(token)
    self.invitation = Invitation.find_by_invitation_token(invitation_token)
  end
  
  def next_birthday
    birthday_this_year = Date.parse(self.birth_date.strftime('%m%d'))
    birthday_this_year.past? ? 1.year.since(birthday_this_year) : birthday_this_year
  end
  
  def birthday_days
    (self.next_birthday - Date.today).to_i
  end
  alias :number_of_days_to_next_birthday :birthday_days

  def child_city
    relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.first
  end 
  
  def child_state
    relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.first
  end 

  def first_child_parent
    relationships.where(:relation_type_id => 1).first
  end

  def second_child_parent
    relationships.where(:relation_type_id => 1).last
  end
  
  #def child_city
    #if child_mother.blank?
      #relationships.where(:relation_type_id => 2).map {|p| p.user.address_city }.to_sentence
    #else
      #relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
    #end
  #end 
  
  #def child_state
    #if child_mother.blank?
      #relationships.where(:relation_type_id => 2).map {|p| p.user.address_state }.to_sentence
    #else
      #relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
    #end
  #end 

  #def child_mother
    #relationships.where(:relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
  #end 

  #def child_father
    #relationships.where(:relation_type_id => 2).map {|p| p.user.first_name }.to_sentence
  #end 
  
  def user_child_categories
    categories = self.user_child_cat_prefs.map {|p| p.gift_category_id}
    GiftCategorization.where(:gift_category_id => categories).map {|p| p.gift.name}
  end
  
  def child_followers
    relationships.where(:status => "Confirmed")
  end

  def child_requests
    relationships.where(:status => "Pending")
  end
  
  def profile_picture
    self.child_images.where(:profile => true).try(:first) || self.child_images.try(:first) 
  end
  
  def parents
    parents = self.relationships.where('relation_type_id IN (1)')
    parents.any? ? parents : nil
  end
  
  def number_of_parents
    self.parents.present? ? parents.count : 0
  end
  
  def update_reminders
    unless self.new_record?
      self.relationships.each {|r| r.set_new_due_date(true)} if self.birth_date_changed?
    end
  end
  
  def build_relationship(user_id, relation_type_id)
    self.relationships.create!(:user_id => user_id, :relation_type_id => relation_type_id)
  end
  
end