class ReminderOptionsController < ApplicationController
  
  before_filter :authenticate
  
  def index
    @reminder_option = ReminderOption.find(params[:id])
  end

  def list
    @reminder_options = ReminderOption.find(:all)
  end
  
  def manage
    list
    @reminder_option = ReminderOption.find(params[:id]) if params[:id]
    @reminder_option = ReminderOption.new if @reminder_option.nil?
  end
  
  def create
    @reminder_option = ReminderOption.new(params[:reminder_option])
    if @reminder_option.save
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def update
    @reminder_option = ReminderOption.find(params[:id])
    if @reminder_option.update_attributes(params[:reminder_option])
      redirect_to :action => 'list'
    else
      render :action => 'manage'
    end
  end
  
  def destroy
    ReminderOption.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
end
