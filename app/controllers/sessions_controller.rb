class SessionsController < ApplicationController

  
  include SessionsHelper

  def new
    @page_title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.admin == true
      session[:user_id] = user.id
      redirect_back_or list_gift_path
    elsif user
      session[:user_id] = user.id
      redirect_back_or user  
    else
      flash.now[:error] = "Invalid email / password combination."
      render "new"
    end
  end

  def destroy
    sign_out
    redirect_to root_path, :notice => "You are logged out."
  end

end
