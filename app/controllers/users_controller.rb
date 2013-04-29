class UsersController < ApplicationController

  layout "user", :except => [:new, :thankyou]
  
  include SessionsHelper
  include UsersHelper

  before_filter :activated?, :except => [:new, :create, :confirm, :thankyou]
  before_filter :authenticate, :except => [:new, :create, :confirm, :thankyou]
  before_filter :correct_user, :except => [:new, :create, :confirm, :thankyou]

  def new
    @user = User.new
  end  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_out
      redirect_to thankyou_path
    else
      render 'new', :layout => 'application'
    end
  end
  
  def confirm
    user = User.find(:first, :conditions => {:confirmation_token => params[:confirmation_token]}) unless params[:confirmation_token].blank?
    case
    when (!params[:confirmation_token].blank?) && user && !user.confirmed?
      user.confirm!
      flash[:notice] = "Account Activated."
      redirect_to sign_in_path
    when params[:confirmation_token].blank?
      flash[:error] = "We couldn't find you. Please follow the URL from your email."
      redirect_to root_path
    else
      flash[:error] = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_to root_path
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
    @relationship_my_kids = current_user.relationships.where(:relation_type_id => 1)
    @find_my_kids = Invitation.invitation_by_email(current_user)
    @relationships = Relationship.where(:user_id => current_user.id).limit(20)
    @all_relationships = Relationship.where(:user_id => current_user.id)
    @relationships_by_birth_date = @all_relationships.sort_by! {|b| b.child.birthday_days}
    @relationships_by_name = @relationships.sort_by! {|b| b.child.first_name}
    
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
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
    @invitations = Invitation.invitation_by_email(current_user)
    @invited_children = Invitation.invited_children(current_user)
    @confirmed_children = current_user.my_kids
  end
  
  def thankyou
  end

  private
  
  def activated?
    @user = User.find(params[:id])
    unless @user.confirmed == true
      sign_out
      redirect_to root_path, :flash => { :error => "Your account is not yet activated." } 
    end
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to root_path unless current_user?(@user)
  end


end