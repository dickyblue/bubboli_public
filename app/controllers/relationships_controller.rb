class RelationshipsController < ApplicationController

  include SessionsHelper
  
  def show
    @relationship = Relationship.find(params[:id])
    @child = @relationship.child
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name }.to_sentence

    @categories = @relationship.user_child_category_preferences.map {|p| p.gift_category_id}
    @gifts = GiftCategorization.where(:gift_category_id => @categories)
    @gift_by_gender = Gift.where(:gender => [@child.gender, "Unisex"]).map {|p| p.name }

    @gift = Gift.gift_by_gender(@child).to_sentence
    @age = Gift.gift_by_age_range(@child).map {|p| p.gift.name }.to_sentence
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
