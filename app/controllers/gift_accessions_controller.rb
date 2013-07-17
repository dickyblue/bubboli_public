class GiftAccessionsController < ApplicationController

  before_filter :get_child, :except => [:approve]
  before_filter :authenticate, :except => [:approve]

  def index
    @search = Gift.search(params[:search])
    @search_gift = @search.all
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @gift_accessions = @child.gift_accessions
    @gift_accession = @child.gift_accessions.build
    @gift_purchased = @child.gift_accessions.where(:approved => true)
  end

  def new
    @gift_accession = @child.gift_accessions.build
  end
  
  def create
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @gift_accession = @child.gift_accessions.new(params[:gift_accession])
    @gift_accession.user_id = current_user.id
    @gift_accession.save
    respond_to do |format|
      format.html { redirect_to @relationship }
      format.js  
      flash[:success] = "Your gift is awaiting approval by the parent." unless @gift_accession.giver.is_parent_of?(@gift_accession.giftee)
    end
  end

  def update
    @relationship = Relationship.where(:user_id => current_user.id, :child_id => @child.id).first
    @gift_accession = @child.gift_accessions.find(params[:id])
    @gift_accession.update_attributes!(params[:gift_accession])
    respond_to do |format|
      format.html { redirect_to @relationship }
      format.js  
    end
  end
  
  def approve
    ga = GiftAccession.find(:first, :conditions => {:gift_accession_token => params[:gift_accession_token]}) unless params[:gift_accession_token].blank?
    case
    when (!params[:gift_accession_token].blank?) && ga && !ga.approved?
      ga.approve!
      flash[:notice] = "#{ga.gift.name} has been added to #{ga.giftee.first_name}'s purchased list."
      redirect_to root_path
    when params[:gift_accession_token].blank?
      flash[:error] = "We couldn't find this gift.  Perhaps you had already added it to #{ga.giftee.first_name}'s purchased list."
      redirect_to root_path
    else
      flash[:error] = "We couldn't find this gift.  Perhaps you had already added it to #{ga.giftee.first_name}'s purchased list."
      redirect_to root_path
    end
  end

  def destroy
    @gift_accession = @child.gift_accessions.find(params[:id])
    @gift_accession.destroy
    respond_to do |format|
      format.html { redirect_to current_user }
      format.js  
    end
  end

  private
  
  def get_child
    @child = Child.find(params[:child_id])
  end

end
