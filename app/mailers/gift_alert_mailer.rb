class GiftAlertMailer < ActionMailer::Base
  default from: "contact@bubboli.com"
  
  def gift_alert(gift_accession)
    @gift_accession = gift_accession
    @user = gift_accession.giver
    @child = gift_accession.giftee
    @parent = @child.parents.first.user
    @gift = gift_accession.gift
    @page = child_url(@child)
    @image = image_tag @gift.gift_images.first.image_url(:thumb_pic)
    mail :to => @parent.email, :subject => "Gift purchase: #{@user.first_name} just purchased a gift for #{@child.first_name}'s birthday"
  end
end
