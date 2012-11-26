class RelationshipsController < ApplicationController

  include SessionsHelper
  
  def show
    @relationship = Relationship.find(params[:id])
    @child = @relationship.child
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name }.to_sentence

    @categories = @relationship.user_child_category_preferences.map {|p| p.gift_category_id}
    @gifts = GiftCategorization.where(:gift_category_id => @categories).map {|p| p.gift.name}

    @gifts_by_gender_age = Gift.get_gift_by_gender_and_age(@child)
    @gifts_by_gender_age_category = Gift.get_gift_by_gender_and_age(@child).joins(:gift_categorizations).merge(GiftCategorization.where(:gift_category_id => @categories)).map {|p| p.name }
  end
  
  def update
    @relationship = Relationship.find(params[:id])
    if @relationship.update_attributes(params[:relationship])
      redirect_to :action => 'show'
    else
      render 'show'
    end
  end
    
end
