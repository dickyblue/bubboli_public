namespace :update_price_from_amazon do
  task :price => :environment do
    # gifts = Gift.where(:merchant => "Amazon")
    # gifts.each do |gift|
    #   asin = Amazon::Ecs.item_lookup(gift.sku, {:response_group => "OfferListings"})
    #   amazon_price = asin.items.first.get("Offers/Offer/OfferListing/Price/Amount").to_i
    #   gift.price = amazon_price 
    #   gift.save
    #   a = gift.gift_price_classifications.first
    #   if amazon_price.between?(0, 2500)
    #     a.gift_price_range_id = 1
    #   elsif amazon_price.between?(2501, 5000)
    #     a.gift_price_range_id = 2
    #   elsif amazon_price.between?(5001, 7500)
    #     a.gift_price_range_id = 3
    #   else (amazon_price >= 7501)
    #     a.gift_price_range_id = 4
    #   end
    #   a.save    
    #   gift.price = gift.price/100
    #   gift.save 
    # end
    gifts = Gift.where(:merchant => "Amazon")
    gifts.each do |gift|  
      UpdatePriceWorker.perform_async(gift.id)
    end
  end
end