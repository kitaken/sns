class Event < ActiveRecord::Base
  has_many :attendances
end
