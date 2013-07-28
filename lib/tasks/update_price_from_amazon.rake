namespace :update_price do
  task :price => :environment do
    gifts = Gift.where(:merchant => "Amazon")
  end