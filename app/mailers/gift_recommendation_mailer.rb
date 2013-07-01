class GiftRecommendationMailer < ActionMailer::Base
  default from: "contact@bubboli.com"

    # def test_recommendation(relationship)
    #   @user = User.first
    #   @child = @user.relationship.first.child
    #   @gift_one = Gift.find(1)
    #   @gift_two = Gift.find(2)
    #   @gift_one_image = @gift_one.gift_images.first.image_url(:thumb_pic)    
    #   @gift_two_image = @gift_two.gift_images.first.image_url(:thumb_pic)    
    #   @gift_one_desc = @gift_one.description.truncate(100)
    #   mail :to => relationship.user.email, :subject => "Your gift recommendations for #{@child.first_name}"
    # end

    def gift_recommendation(relationship)
      @user = relationship.user.first_name
      @child = relationship.child
      @gifts = Gift.gift_by_pref_all_cat(@child, relationship, limit=6)      
      mail :to => relationship.user.email, :subject => "#{@child.first_name}'s birthday is coming up! Here are the recommendations you requested."
    end

    
end
