namespace :update_price_from_amazon do
  task :price => :environment do
    gifts = Gift.where(:merchant => "Amazon")
    gifts.each do |gift|
      asin = Amazon::Ecs.item_lookup(gift.sku, {:response_group => "OfferListings"})
      asin.items.each do |item|
        amazon_price = item.get("Offers/Offer/OfferListing/Price").to_i
      end  
      gift.price = amazon_price 
      gift.save 
    end
  end
end