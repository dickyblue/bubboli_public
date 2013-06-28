class ChildrenController < ApplicationController

  include SessionsHelper
  include ChildrenHelper
  
  before_filter :authenticate
  

  def search_child
    @search_term = params[:search].values[0] if params[:search]
    #@relation_type = RelationType.where('id <>?', 1)
    @relation_type = RelationType.non_parent
    @search = Child.search params[:search]
    if is_a_valid_email?(@search_term)
      @user = User.where('email = ? OR work_email = ?', @search_term, @search_term) if @search_term
      @children = @search.where('relationships.relation_type_id = ?', 1)
      @child = Child.new unless @children.present?
      @allow_invite = true
    else      
    end
  end


  # def new
  #   @child = Child.new
  #   @child.invitations.build
  #   @child.relationships.build
  # end
  
  def create
    @child = Child.new(params[:child])
    @search_term = params[:invitee] if params[:invitee]
    if @child.save
      @relationship = @child.build_relationship(current_user.id, params[:relation_type_ids]) #build_relationships method in child model to make this more rails friendly
      #@child.relationships.create!(:user_id => current_user.id, :relation_type_id => params[:relation_type_ids]) # Changed from relationships.last.update_attributes because relationship was not created at creation of child
      @child.invitations.create!(:sender => current_user, :recipient_email => params[:invitee], :send_invitation => params[:invite] )
      redirect_to current_user
      flash[:success] = "Thank you.  Tailor the gift preferences for #{@child.first_name} <a href='#{url_for(@relationship)}'>here</a> so we can
      better tailor our recommendations!".html_safe.
    else
      flash[:error] = "Please fix the errors below."
      render "new"
    end
  end

  def edit
    @child = Child.find(params[:id])
    unless parents_only?
      redirect_to current_user
      flash[:error] = "You can't edit this child."
    end
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

  def parents_only?
    current_user.is_parent_of?(@child) || @child.parents.blank?
  end

end
