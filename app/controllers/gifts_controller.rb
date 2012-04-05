class GiftsController < ApplicationController

  before_filter :authenticate, :except => [:index, :favorite, :brands, :show]
  
  def index
    @search = Gift.search(params[:search])
    @gifts = @search.paginate(:page => params[:page], :per_page => 9, :order => "created_at DESC")
  end
  
  def list
    @gifts = Gift.find(:all)    
  end

  def manage
    @gift = Gift.new if @gift.nil?
    4.times { @gift.gift_images.build }
    @gift = Gift.find(params[:id]) if params[:id]
    @all_gift_categories = get_all_categories
  end
  
  def show
    @gift = Gift.find(params[:id])
    @images = GiftImage.where(:gift_id => @gift.id)
    category_ids = @gift.gift_categorizations.map(&:gift_category_id)
    gift_categorizations = GiftCategorization.select("distinct gift_id").where(:gift_category_id => category_ids).where("gift_id != ?",@gift.id)
    @similar_gifts = Gift.where(:id => gift_categorizations.map(&:gift_id)).random(3)
  end
  
  def create
    @all_gift_categories = get_all_categories
    checked_gift_categories = get_gift_categories_from(params[:gift_categories])
    removed_gift_categories = @all_gift_categories - checked_gift_categories
    @gift = Gift.new(params[:gift])
    if @gift.save
      checked_gift_categories.each {|cat| @gift.gift_categories << cat if !@gift.gift_categories.include?(cat)}
      removed_gift_categories.each {|cat| @gift.gift_categories.delete(cat) if @gift.gift_categories.include?(cat)}
      redirect_to(:action => 'list')
    else
      render "manage"
    end
  end
    
  def update
    @all_gift_categories = get_all_categories
    checked_gift_categories = get_gift_categories_from(params[:gift_categories])
    removed_gift_categories = @all_gift_categories - checked_gift_categories
    @gift = Gift.find(params[:id])
    if @gift.update_attributes(params[:gift])
      checked_gift_categories.each {|cat| @gift.gift_categories << cat if !@gift.gift_categories.include?(cat)}
      removed_gift_categories.each {|cat| @gift.gift_categories.delete(cat) if @gift.gift_categories.include?(cat)}
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

  private

  def get_all_categories
    return GiftCategory.find(:all)
  end
  
  def get_gift_categories_from(cat_list)
    cat_list =[] if cat_list.blank?
    return cat_list.collect {|cid| GiftCategory.find_by_id(cid.to_i)}.compact
  end
  
end
