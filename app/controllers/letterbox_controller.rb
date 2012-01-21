class LetterboxController < ApplicationController
  before_filter :authenticate_user!
  def index
  end

  def conversation
    @letters = Letter.conversation(params[:id].to_i,current_user.id).order_by('created_at DESC').limit(10)
    @new_letter = Letter.new
    @new_letter.sender_id = current_user.id
  end
end
