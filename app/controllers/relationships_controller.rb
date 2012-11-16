class RelationshipsController < ApplicationController

  include SessionsHelper
  
  def show
    @relationship = Relationship.find(params[:id])
    @child = @relationship.child
    @city = @child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_city }.to_sentence
    @state = @child.relationships.where(:relation_type_id => 1).map {|p| p.user.address_state }.to_sentence
    @relation = @child.relationships.where(:user_id => current_user.id).map {|p| p.relation_type.name }.to_sentence
    @mother = @child.relationships.where(:relation_type_id => 1).map {|p| p.user.first_name }.to_sentence
    @father = @child.relationships.where(:relation_type_id => 2).map {|p| p.user.first_name }.to_sentence    
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
