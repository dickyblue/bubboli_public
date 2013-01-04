class GiftAgeClassification < ActiveRecord::Base

  attr_accessible :gift_age_range_id, :gift_id

  belongs_to  :gift
  belongs_to  :gift_age_range

  def self.gift_by_age_range(child)
    age = ((child.birth_date.month - Date.today.month) + 12*(Date.today.year - child.birth_date.year))/12
    if age < 1
      where(:gift_age_range_id => 1)
    elsif age == 1
      where(:gift_age_range_id => 2)
    elsif age == 2
      where(:gift_age_range_id => 3)
    elsif (3..4).include?(age)
      where(:gift_age_range_id => 4)
    elsif (5..7).include?(age)
      where(:gift_age_range_id => 5)
    elsif (8..11).include?(age)
      where(:gift_age_range_id => 6)
    else age >= 12
      where(:gift_age_range_id => 7)
    end
  end
  

end
