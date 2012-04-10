class GiftsController < ApplicationController

  before_filter :authenticate, :except => [:index, :favorite, :brands, :show]
  
  def index
    @search = Gift.search(params[:search])
    @gifts = @search.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
    @all_gift_categories = GiftCategory.all
    @all_gift_age_ranges = GiftAgeRange.all
  end
  
  def list
    @gifts = Gift.find(:all)    
  end

  def manage
    @gift = Gift.new if @gift.nil?
    4.times { @gift.gift_images.build }
    @gift = Gift.find(params[:id]) if params[:id]
  end
  
  def show
    @gift = Gift.find(params[:id])
    @images = GiftImage.where(:gift_id => @gift.id)
    category_ids = @gift.gift_categorizations.map(&:gift_category_id)
    gift_categorizations = GiftCategorization.select("distinct gift_id").where(:gift_category_id => category_ids).where("gift_id != ?",@gift.id)
    @similar_gifts = Gift.where(:id => gift_categorizations.map(&:gift_id)).random(5)
  end
  
  def create
    @gift = Gift.new(params[:gift])
    if @gift.save
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      redirect_to(:action => 'list')
    else
      render "manage"
    end    
  end
  
  def destroy
    Gift.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  def favorite
    @search_favorite = Gift.where(:favorite => true).search(params[:search])
    @gifts = @search_favorite.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
  end
  
  
  def brands
  end  


  
end
