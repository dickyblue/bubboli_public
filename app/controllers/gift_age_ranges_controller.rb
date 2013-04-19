class GiftAgeRangesController < ApplicationController

  before_filter :verify_is_admin


  def list
    @gift_age_ranges = GiftAgeRange.find(:all)
  end

  def manage
    list
    @gift_age_range = GiftAgeRange.find(params[:id]) if params[:id]
    @gift_age_range = GiftAgeRange.new if @gift_age_range.nil?
  end


  def create
    @gift_age_range = GiftAgeRange.new(params[:gift_age_range])
    if @gift_age_range.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end

  def update
    @gift_age_range = GiftAgeRange.find(params[:id])
    if @gift_age_range.update_attributes(params[:gift_age_range])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end

  def destroy
    GiftAgeRange.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
