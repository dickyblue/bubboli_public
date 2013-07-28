namespace :update_price do
  task :price => :environment do
    gifts = Gift.where(:merchant => "Amazon")
    errors = []
    gifts.each do |gift|
      asin = Amazon::Ecs.item_lookup("#{gift.sku}", {:response_group => "OfferListings"})
      asin.items.each do |item|
      price = item.get("Offers/Offer/OfferListing/Price").to_i
    end
    if price == 0
      errors << gift.sku 
    else 
      gift.price = price 
      gift.save 
      puts "These gifts did not update #{errors.inspect}" 
    end 
  end