class UsersController < ApplicationController

  layout "user"
  
  include SessionsHelper
  include UsersHelper

  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :except => [:new, :create]

  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated."
      redirect_to @user
    else
      render 'edit'
    end    
  end

  def show
    @user = User.find(params[:id])
    @search = User.search(params[:search])
    @users = @search.all
    @kids = Relationship.where(:user_id => current_user.id).limit(20)
  end
  
  def kids_follow
  end
  

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end


end