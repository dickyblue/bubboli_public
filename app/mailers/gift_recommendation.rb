class GiftRecommendation < ActionMailer::Base
  default from: "contact@bubboli.com"

    def gift_recommendations(relationship)
      @user = User.first
      @child = @user.relationship.first.child
      @gift_one = Gift.find(1)
      @gift_two = Gift.find(2)
      @gift_one_image = @gift_one.gift_images.first.image_url(:thumb_pic)    
      @gift_two_image = @gift_two.gift_images.first.image_url(:thumb_pic)    
      @gift_one_desc = @gift_one.description.truncate(100)
      mail :to => relationship.user.email, :subject => "Test Mandrill"
    end

    def recommendations(relationship)
      @user = relationship.user.first_name
      @child = relationship.child
      @gift_one = Gift.gift_by_pref_all_cat(@child, relationship)[0]
      @gift_two = Gift.gift_by_pref_all_cat(@child, relationship)[1]
      @gift_one_image = @gift_one.gift_images.first.image_url(:thumb_pic)    
      @gift_one_desc = @gift_one.description.truncate(100)
      mail :to => relationship.user.email, :subject => "Test Mandrill"
    end

    
end
