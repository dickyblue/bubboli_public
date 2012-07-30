class GiftCategoriesController < ApplicationController
  
  before_filter :authenticate


  def list
    @gift_categories = GiftCategory.find(:all)
  end

  def manage
    list
    @gift_category = GiftCategory.find(params[:id]) if params[:id]
    @gift_category = GiftCategory.new if @gift_category.nil?
  end
    
  def create
    @gift_category = GiftCategory.new(params[:gift_category])
    if @gift_category.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def update
    @gift_category = GiftCategory.find(params[:id])
    if @gift_category.update_attributes(params[:gift_category])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def destroy
    GiftCategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  

end
