class Event < ActiveRecord::Base
  has_many :attendances
  belongs_to :category
end
