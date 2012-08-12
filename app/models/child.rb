class Child < ActiveRecord::Base
  
  attr_accessible :first_name, :gender, :birth_date, :relation_type_ids
  
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
  
end