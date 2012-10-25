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
  
  def birthday
    (Date.parse(Date.today.strftime('%m%d')) - Date.parse(self.birth_date.strftime('%m%d'))).to_i
  end
  
  def next_birthday
    year = Date.today.year
    mmdd = birth_date.strftime('%m%d')
    year += 1 if mmdd < Date.today.strftime('%m%d')
    mmdd = '0301' if mmdd == '0229' && !Date.parse("#{year}0101").leap?
    return Date.parse("#{year}#{mmdd}")
  end
  
  
end