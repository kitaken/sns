class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar, :styles => { :medium => "256x256", :thumb => "48x48" }
end
