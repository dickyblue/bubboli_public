class MailchimpNewslettersController < ApplicationController
  
  def submit
    gb = Gibbon::API.new(ENV['MAILCHIMP_API_KEY'])
    response = gb.lists.subscribe({:id => 'MAILCHIMP_NEWSLETTER_LIST_ID', :email => params[:email]})
  end
  
end
