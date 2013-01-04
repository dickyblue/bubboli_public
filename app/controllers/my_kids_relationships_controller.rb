class MyKidsRelationshipsController < ApplicationController

  def update
    @relationship = Relationship.where(:child_id => current_user.relationships.where(:relation_type_id => [1,2]).pluck(:child_id), :status => "Pending").find(params[:id])
    current_user.approve!(@relationship)
    redirect_to current_user     
  end
    
  def destroy    
    @relationship = Relationship.where(:child_id => current_user.relationships.where(:relation_type_id => [1,2]).pluck(:child_id), :status => "Pending").find(params[:id])
    current_user.ignore!(@relationship)
    redirect_to current_user 
  end   
  


end
