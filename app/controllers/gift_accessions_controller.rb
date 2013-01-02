class GiftAccessionsController < ApplicationController

  before_filter :get_child

  def new
    @gift_accession = @child.gift_accessions.build
  end
  
  def create
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @gift_accession = @child.gift_accessions.create(params[:gift_accession])
    @gift_accession.user = current_user
    respond_to do |format|
      format.html { redirect_to @relationship }
      format.js  
      flash[:success] = "Your gift is awaiting approval by the parent."
    end
  end
  
  def index
    @search = Gift.search(params[:search])
    @search_gift = @search.all
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @gift_accessions = @child.gift_accessions
    @gift_accession = @child.gift_accessions.build
    @gift_purchased = @child.gift_accessions.approved_purchased_gifts
  end

  private
  
  def get_child
    @child = Child.find(params[:child_id])
  end

end
