class PagesController < ApplicationController
  
  layout 'pages'

  def about
  end
  
  def gift_recommendation
    relationship = Relationship.last
    @user = relationship.user.first_name
    @child = relationship.child
    @gifts = Gift.gift_by_pref_all_cat(@child, relationship).limit(6)
  end
end
