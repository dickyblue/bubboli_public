class PagesController < ApplicationController
  
  layout 'pages'

  def about
  end
  
  #only for viewing online
  def gift_recommendation
    relationship = Relationship.last
    @user = relationship.user.first_name
    @child = relationship.child
    @gifts = Gift.gift_by_pref_all_cat(@child, relationship).limit(6)
  end
  
  #only for viewing online
  def friend_alert
    relationship = Relationship.last
    @user = relationship.user
    @child = relationship.child
    @parent = @child.parents.first.user
  end

  #only for viewing online
  def gift_alert
    gift_accession = GiftAccession.first
    @user = gift_accession.giver
    @child = gift_accession.giftee
    @parent = @child.parents.first.user if @child.parents
    @gift = gift_accession.gift
  end
  
  #only for viewing online
  def password_reset
    @user = User.last
  end
  
  #only for viewing online
  def account_confirmation
    @user = User.first
  end
  
  #only for viewing online
  def invitation
    @invitation = Invitation.last
    @sender = @invitation.sender
    @child = @invitation.child
  end

  
end
