class Letter < ActiveRecord::Base
  belongs_to :sender,   :class_name => :User
  belongs_to :receiver, :class_name => :User
  scope :conversation, lambda{|a,b|where("(sender_id=? and receiver_id=?)or(sender_id=? and receiver_id=?)",a,b,b,a)}
end
