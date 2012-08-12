class InvitationMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def invitation(invitation)
    @invitation = invitation
    mail :to => invitation.recipient_email, :subject => "Invitation for Bubboli"
  end
  
end
