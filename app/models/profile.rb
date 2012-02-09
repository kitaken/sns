class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :thumbnail
end
