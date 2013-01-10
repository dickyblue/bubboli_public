class InvitationsController < ApplicationController

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to current_user
  end

end
