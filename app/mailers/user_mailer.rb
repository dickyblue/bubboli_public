class UserMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def account_confirmation(user)
    @user = user
    mail :to => user.email, :subject => "Email Activation for Bubboli"
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset Instructions"
  end
  
end
