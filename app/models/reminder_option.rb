class ReminderOption < ActiveRecord::Base
  attr_accessible :days, :name
  # include line only if odd number of options: validates_presence_of :days, :name
end
