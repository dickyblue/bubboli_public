class InvitationMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def invitation(invitation)
    @invitation = invitation
    @sender = @invitation.relationship.user
    @child = @invitation.relationship.child
    mail :to => invitation.recipient_email, :subject => "#{@sender.first_name} wants to be reminded of #{@child.first_name}'s birthday on Bubboli"
  end
  
end
