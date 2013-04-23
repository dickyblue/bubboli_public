class ChildrenController < ApplicationController

  include SessionsHelper
  include ChildrenHelper
  
  before_filter :authenticate
#  before_filter :parents_only, :only => [:edit, :update]
  

  def search_child
    @search_term = params[:search].values[0] if params[:search]
    @relation_type = RelationType.where('id <>?', 1)
    @search = Child.search params[:search]
    if is_a_valid_email?(@search_term)
      @user = User.where('email = ? OR work_email = ?', @search_term, @search_term) if @search_term
      @children = @search.where('relationships.relation_type_id = ?', 1)
      @allow_invite = true
    else      
    end
  end


  def new
    @child = Child.new
    @child.invitations.build
    @child.relationships.build
  end
  
  def create
    @child = Child.create!(params[:child])
    if @child.save
      @child.relationships.create!(:user_id => current_user.id) # Changed from relationships.last.update_attributes because relationship was not created at creation of child
      @child.invitations.create!(:sender => current_user, :recipient_email => params[:invitee] )
      redirect_to current_user
      flash[:success] = "Thank you.  An invitation has been sent to #{@child.first_name}'s parent."
    else
      flash[:error] = "User is already registered, but does not have children of their own."
      render "new"
    end
  end

  def edit
    @child = Child.find(params[:id])
  end


  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(params[:child])
      redirect_to current_user
    else
      render "edit"
    end
  end

  private

#  def parents_only
#    child = Child.find(params[:id])
#    if child.parents.nil? 
#      render 'edit'
#    elsif child.parents.include?(current_user)
#      render 'edit'
#    else
#      redirect_to current_user
#    end  
#  end

end
