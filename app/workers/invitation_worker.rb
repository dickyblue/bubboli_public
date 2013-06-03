# class InvitationWorker
#   
#   include Sidekiq::Worker
#   
#   sidekiq_options queue: "invitations"
#   sidekiq_options :failures => true
#   
#   def perform
#     send_invitation_email
#   end
#   
#   def send_invitation_email
#     Invitation.where('send_invitation = ?', true).each do |invite|
#       invite.send_invite_email
#     end
#   end
#     
# end