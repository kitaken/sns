class Letter < ActiveRecord::Base
  belongs_to :sender,   :class_name => :user
  belongs_to :receiver, :class_name => :user
  scope :conversation, lambda{|a,b|where("(sender_id=? and receiver_id=?)or(sender_id=? and receiver_id=?)",a,b,b,a)}
end
