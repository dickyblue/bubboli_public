namespace :update_price_from_amazon do
  task :price => :environment do
    gifts = Gift.where(:merchant => "Amazon")
    gifts.each do |gift|
      asin = Amazon::Ecs.item_lookup(gift.sku, {:response_group => "OfferListings"})
      asin.items.each do |item|
        amazon_price = item.get("Offers/Offer/OfferListing/Price/Amount")
      end  
      gift.price = amazon_price.to_i 
      gift.save 
    end
  end
end