class RelationshipsController < ApplicationController

  include SessionsHelper
  layout 'relationship'
  
  before_filter :authenticate
  before_filter :correct_user, :except => [:create]
  
  def show
    @relationship = Relationship.find(params[:id])
    @user = @relationship.user
    @child = @relationship.child
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name if p.relation_type }.to_sentence
    @gifts_by_user_pref = Gift.gift_by_pref_all_cat(@child, @relationship)
    @child_images = @child.child_images
    @five_photos = @child_images.limit(5)
    @gift_purchased = @child.gift_accessions.where(:approved => true)
    @approve_gifts = @child.gift_accessions.where(:approved => false)
    @search = Gift.search(params[:search])
    @relation_type = RelationType.where('id <>?', 1) unless @relationship.user.is_parent_of?(@relationship.child)
    
    if request.path != relationship_path(@relationship)
      redirect_to @relationship, status: :moved_permanently
    end
    
  end
  
  def create
    @relationship = Relationship.new(params[:relationship])
    @relationship.user_id = current_user.id
    if @relationship.save
      redirect_to current_user
    else
      redirect_back_to
    end
  end
  
  def update
    @relationship = Relationship.find(params[:id])
    @relationship.update_attributes!(params[:relationship])
    respond_to do |format|
      format.html { redirect_to @relationship }
      format.js  
    end      
  end

  def destroy
    @child = current_user.relationships.find(params[:id]).child
    current_user.unfollow!(@child)
    redirect_to current_user
  end
    
  private
  
  def correct_user
    relationship = Relationship.find(params[:id])
    user = relationship.user
    redirect_to current_user unless user == current_user 
  end
  
  
      
end
