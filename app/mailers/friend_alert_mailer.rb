class FriendAlertMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def friend_alert(relationship)
    @relationship = relationship
    @user = relationship.user
    @child = relationship.child
    @parent = @child.parents.first.user
    @page = requests_url(@parent)
    @gift = Gift.first
    mail :to => @parent.email, :subject => "#{@user.first_name} wants to be reminded of #{@child.first_name}'s birthday on Bubboli"
  end  
  
end
