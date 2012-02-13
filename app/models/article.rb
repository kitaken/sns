class Article < ActiveRecord::Base
  belongs_to :user
  has_many :translations
  belongs_to :category
end
