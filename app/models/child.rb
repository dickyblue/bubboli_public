class Child < ActiveRecord::Base
  
  attr_accessible :first_name, :gender, :birth_date, :relation_type_ids, :invitations_attributes, :relationships_attributes
  
  validates :first_name, :gender, :birth_date, :presence => true

  has_many :relationships
  has_many :relation_types, :through => :relationships
  has_many :users, :through => :relationships

  has_many :invitations
  
  accepts_nested_attributes_for :invitations
  
  def invitation_token
    invitation.token if invitation
  end
  
  def invitation_token=(token)
    self.invitation = Invitation.find_by_invitation_token(invitation_token)
  end
  
  def birthday_days
    (Date.parse(self.birth_date.strftime('%m%d')) - Date.parse(Date.today.strftime('%m%d'))).to_i
  end
  
  def mom
    relation_types.where(:id => 1)
  end
  
  def child_city
    if mom.blank?
      relationships.where(:relation_type_id => 2).map {|p| p.user.address_city }.to_sentence
    else
      relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
    end
  end 
  
  def child_state
    if mom.blank?
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

  
end