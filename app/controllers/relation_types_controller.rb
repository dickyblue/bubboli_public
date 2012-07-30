class RelationTypesController < ApplicationController

  def list
    @relation_types = RelationType.find(:all)
  end
  
  def manage
    @relation_type = RelationType.new if @relation_type.nil?
    @relation_type = RelationType.find(params[:id]) if params[:id]  
  end

  def create
    @relation_type = RelationType.new(params[:relation_type])
    if @relation_type.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def update
    @relation_type = RelationType.find(params[:id])
    if @relation_type.update_attributes(params[:relation_type])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def destroy
    RelationType.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
