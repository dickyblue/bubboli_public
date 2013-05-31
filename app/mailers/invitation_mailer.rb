class InvitationMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def invitation(invitation)
    @invitation = invitation
    @sender = @invitation.sender
    @child = @invitation.child
    mail :to => invitation.recipient_email, :subject => "Invitation for Bubboli"
  end
  
end
