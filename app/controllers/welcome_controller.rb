class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    friend_ids = current_user.friends.where('friendships.status="friend"').select('users.id').map(&:id)
    @activities = Activity.where('user_id in (?) or category_id = ?',friend_ids.join(','),current_user.category_id)
  end

  def preferences
    @user = User.find(current_user.id)
    if request.post?
      @user.update_attributes(params[:user])
    end
  end


end
