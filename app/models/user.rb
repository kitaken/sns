class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname

  has_one :profile
  has_many :friendships
  has_many :friends, :through=>:friendships, :class_name => :User, :source=>:friend
  after_create :add_profile
  def add_profile
    profile = Profile.new
    profile.id = self.id
    profile.user_id = self.id
    if !profile.save
      raise Exception 
    end
  end
end
