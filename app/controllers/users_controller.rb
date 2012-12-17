class UsersController < ApplicationController

  layout "user", :except => [:new]
  
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
    @user = current_user
    @search = User.search(params[:search])
    @users = @search.all
    @relationships = Relationship.where(:user_id => current_user.id).where(:status => "Confirmed").limit(20)
    @relationships_by_birth_date = @relationships.sort_by! {|b| b.child.birthday_days}
    @relationships_by_name = @relationships.sort_by! {|b| b.child.first_name}
  end
  
  def following
    @following = current_user.followings
  end
  
  def pending
    @pending = current_user.pending
  end
  
  def followers
    @followers = current_user.my_kids_followers
  end
  
  def requests
    @requests = current_user.my_kids_requests
  end
  

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end


end