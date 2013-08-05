class UpdatePriceWorker
  
  include Sidekiq::Worker
  
  sidekiq_options queue: "update_price"
  sidekiq_options :failures => true
  
  def perform(gift_id)
      gift = Gift.find(gift_id)
      asin = Amazon::Ecs.item_lookup(gift.sku, {:response_group => "OfferListings"})
      amazon_price_unfiltered = asin.items.first.get("Offers/Offer/OfferListing/Price/Amount").to_i
      if amazon_price_unfiltered == 0
        gift.price_error = true
      else
        gift.price = amazon_price_unfiltered 
      end
      gift.save  
      a = gift.gift_price_classifications.first
      p = number_to_currency(gift.price)
      if p.between?("$0.01", "$25.00")
        a.gift_price_range_id = 1
      elsif p.between?("$25.01", "$50.00")
        a.gift_price_range_id = 2
      elsif p.between?("$50.01", "75.00")
        a.gift_price_range_id = 3
      else (p >= "$75.01")
        a.gift_price_range_id = 4
      end
      a.save    
      gift.price = gift.price/100
      gift.save 
  end
end