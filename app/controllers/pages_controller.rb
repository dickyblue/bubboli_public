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
  
end
