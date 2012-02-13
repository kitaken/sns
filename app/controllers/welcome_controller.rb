class WelcomeController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def preferences
    @user = User.find(current_user.id)
    @categories = Category.all
    if request.post?
      @user.update_attributes(params[:user])
    end
  end


end
