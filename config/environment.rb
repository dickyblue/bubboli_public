# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
BubboliKids::Application.initialize!

# mandrill
config.action_mailer.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "bubboli",
    :password  => "42tOVqQSZKWbeUjFrx2fVw",
    :authentication => 'login' # Mandrill supports 'plain' or 'login'
  }