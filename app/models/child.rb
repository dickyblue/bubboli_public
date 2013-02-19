class Child < ActiveRecord::Base
  
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
  
  accepts_nested_attributes_for :invitations
  accepts_nested_attributes_for :child_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  
  def invitation_token
    invitation.token if invitation
  end
  
  def invitation_token=(token)
    self.invitation = Invitation.find_by_invitation_token(invitation_token)
  end
  
  def birthday_days
    (Date.parse(self.birth_date.strftime('%m%d')) - Date.parse(Date.today.strftime('%m%d'))).to_i
  end
  
  def child_city
    if child_mother.blank?
      relationships.where(:relation_type_id => 2).map {|p| p.user.address_city }.to_sentence
    else
      relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
    end
  end 
  
  def child_state
    if child_mother.blank?
      relationships.where(:relation_type_id => 2).map {|p| p.user.address_state }.to_sentence
    else
      relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
    end
  end 

  def child_mother
    relationships.where(:relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
  end 

  def child_father
    relationships.where(:relation_type_id => 2).map {|p| p.user.first_name }.to_sentence
  end 
  
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
    profile_picture = self.child_images.where(:profile => true).try(:first) || self.child_images.try(:first) 
  end
  
  def parents
    parents = self.relationships.where('relationship_type IN (1,2)')
    parents.any? ? parents : nil
  end
  
end