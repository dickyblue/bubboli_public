class InvitationsController < ApplicationController

  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to current_user
  end
  
  def confirm_or_delete
    @invitation = Invitation.find(params[:invitation][:id])
    @child = Child.find_by_id params[:child] if params[:child].present?
    if @child
      @invitation.confirm_as_child(@child)
      flash[:success] = "Child confirmed"
    elsif params[:child] == 'delete'
      @invitation.destroy
      flash[:success] = "Request deleted"
    else
      flash[:error] = "There was a problem with your selection.  Please try again."
    end
    redirect_to requests_path
  end

end
