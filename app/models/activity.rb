class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :model, :polymorphic => true
end
