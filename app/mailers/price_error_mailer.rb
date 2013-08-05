class PriceErrorMailer < ActionMailer::Base

  def price_error(user)
    user = User.where(:email => "ming@bubboli.com")
    gifts = Gift.where(:price_error => true)
    mail :from => "contact@bubboli.com", :to => user.email, :subject => "Price Errors"
  end

end
