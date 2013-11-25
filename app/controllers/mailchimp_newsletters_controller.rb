class MailchimpNewslettersController < ApplicationController
  
  def subscribe
    gb = Gibbon::API.new(ENV['MAILCHIMP_API_KEY'])
    list_id = ENV['MAILCHIMP_NEWSLETTER_LIST_ID']
    gb.lists.subscribe({:id => "#{list_id}", :email => {:email => params[:email]}})
  end
  
end
