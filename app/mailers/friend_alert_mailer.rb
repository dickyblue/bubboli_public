class FriendAlertMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def friend_alert(relationship)
    @user = relationship.user
    @child = relationship.child
    @parent = @child.parents.first.user
    mail :to => @parent.email, :subject => "#{@user.first_name} wants to be reminder of #{@child.first_name}'s birthday"
  end  
  
end
