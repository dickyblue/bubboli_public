class FriendAlertMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def friend_alert(relationship)
    @user = relationship.user
    @child = relationship.child
    @parent = @child.parents.first.user
    @user_profile = @user.image ? image_tag @user.image_url(:thumb) : "profile_pic_default.jpg"
    mail :to => @parent.email, :subject => "#{@user.first_name} wants to be reminder of #{@child.first_name}'s birthday"
  end  
  
end
