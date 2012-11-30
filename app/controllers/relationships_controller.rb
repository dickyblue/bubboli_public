class RelationshipsController < ApplicationController

  include SessionsHelper
  
  def show
    @relationship = Relationship.find(params[:id])
    @child = @relationship.child
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name }.to_sentence

    @categories = @relationship.user_child_cat_prefs.map {|p| p.gift_category_id}
    @gifts_by_cat = GiftCategorization.where(:gift_category_id => @categories).map {|p| p.gift.name}
    @gifts_by_dup_cat = GiftCategorization.where(:gift_category_id => @categories).group(:gift_id).having("count(*) >1").map {|p| p.gift.name}

    @gifts_by_gender_age = Gift.get_gift_by_gender_and_age(@child)
    @gifts_by_gender_age_category = Gift.get_gift_by_gender_and_age(@child).joins(:gift_categorizations).merge(GiftCategorization.where(:gift_category_id => @categories)).map {|p| p.name }
    @gifts_by_gender_age_price = Gift.get_gift_by_gender_age_price(@child, @relationship)

    @test = GiftCategorization.gift_by_matching_cat(@relationship)
    @test2 = GiftCategorization.gift_by_three_matching_cat(@relationship).map {|p| p.gift.name }
    @test3 = GiftCategorization.gift_by_two_matching_cat(@relationship)
    @test4 = GiftCategorization.cat_result(@relationship)
    @gifts_by_user_pref = Gift.gift_by_pref_all_cat(@child, @relationship)
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
