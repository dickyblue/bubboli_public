class MailchimpNewslettersController < ApplicationController
  
  def submit
    gb = Gibbon::API.new
    response = gb.list_subscribe({:id => 'e91b3d8a9b', :email => params[:email]})
  end
  
end
