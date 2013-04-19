class GiftPriceRangesController < ApplicationController

  before_filter :verify_is_admin


  def list
    @gift_price_ranges = GiftPriceRange.find(:all)
  end

  def manage
    list
    @gift_price_range = GiftPriceRange.find(params[:id]) if params[:id]
    @gift_price_range = GiftPriceRange.new if @gift_price_range.nil?
  end


  def create
    @gift_price_range = GiftPriceRange.new(params[:gift_price_range])
    if @gift_price_range.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end

  def update
    @gift_price_range = GiftPriceRange.find(params[:id])
    if @gift_price_range.update_attributes(params[:gift_price_range])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end

  def destroy
    GiftPriceRange.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
end
