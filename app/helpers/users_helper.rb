module UsersHelper

  def kids_followings
    Relationship.where(:user_id => current_user.id)
  end

end
