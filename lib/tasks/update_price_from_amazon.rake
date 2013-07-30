namespace :update_price_from_amazon do
  task :price => :environment do
    gifts = Gift.where(:merchant => "Amazon")
    gifts.each do |gift|
      asin = Amazon::Ecs.item_lookup(gift.sku, {:response_group => "OfferListings"})
      # asin.items.each do |item|
      #   amazon_price = item.get("Offers/Offer/OfferListing/Price/Amount")
      # end  
      amazon_price = asin.items.first.get("Offers/Offer/OfferListing/Price/Amount").to_i
      gift.price = amazon_price 
      gift.save
      gift.gift_price_range = [ ]
      if gift.price.between?(0, 2500)
        gift.gift_price_range == 1
      elsif gift.price.between?(2501, 5000)
        gift.gift_price_range == 2
      elsif gift.price.between?(5001, 7500)
        gift.gift_price_range == 3
      else (gift.price >= 7501)
        gift.gift_price_range == 4
      end    
      gift.price = gift.price/100
      gift.save 
    end
  end
end