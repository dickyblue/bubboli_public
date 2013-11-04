class GiftsController < ApplicationController
  
  layout 'gift'

  before_filter :verify_is_admin, :only => [:list, :manage, :create, :update, :destroy]
  
  def index
    @search = Gift.search(params[:search])
    @gifts = @search.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
    @all_gift_categories = GiftCategory.all
    @all_gift_age_ranges = GiftAgeRange.all
    @all_gift_price_ranges = GiftPriceRange.all
    @rotating_gift_image_first = Gift.where(:favorite => true).last
    @rotating_gift_images = Gift.where(:favorite => true).order("created_at DESC").limit(5) - [@rotating_gift_image_first]     
  end
  
  def list
    @search_list = Gift.search(params[:search])
    @gifts = @search_list.paginate(:page => params[:page], :per_page => 10, :order => "created_at DESC")
  end

  def manage
    @gift = Gift.new if @gift.nil?
    5.times { @gift.gift_images.build }
    @gift = Gift.find(params[:id]) if params[:id]
  end
  
  def show
    @gift = Gift.find(params[:id])
    @iframe_url = Gift.get_amazon_reviews(@gift)
    @images = @gift.gift_images.order("id ASC") 
    #@images = GiftImage.where(:gift_id => @gift.id)
    category_ids = @gift.gift_categorizations.map(&:gift_category_id)
    gift_categorizations = GiftCategorization.select("distinct gift_id").where(:gift_category_id => category_ids).where("gift_id != ?",@gift.id)
    @similar_gifts = Gift.where(:id => gift_categorizations.map(&:gift_id)).random(5)
    
    if request.path != gift_path(@gift)
      redirect_to @gift, status: :moved_permanently
    end
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
    @all_gift_categories = GiftCategory.all
    @all_gift_age_ranges = GiftAgeRange.all
    @all_gift_price_ranges = GiftPriceRange.all
  end
  
  def recently_added
    @search_recently_added = Gift.recently_added.search(params[:search])
    @gifts = @search_recently_added.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
    @all_gift_categories = GiftCategory.all
    @all_gift_age_ranges = GiftAgeRange.all
    @all_gift_price_ranges = GiftPriceRange.all
  end
  
  def baby_shower
    @search_baby_shower = Gift.baby_shower_gifts.search(params[:search])
    @gifts = @search_baby_shower.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
    @all_gift_categories = GiftCategory.all
    @all_gift_age_ranges = GiftAgeRange.all
    @all_gift_price_ranges = GiftPriceRange.all    
  end
  
  
  def brands
  end  


  
end
