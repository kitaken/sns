class LetterboxController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def conversation
    receiver_id = params[:id].to_i
    @letters = Letter.conversation(receiver_id,current_user.id).order('created_at DESC').limit(10)
    @user_write_to = User.find(params[:id].to_i)
    @new_letter = Letter.new
    @new_letter.receiver_id = receiver_id
  end
end
