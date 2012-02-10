class FriendsController < ApplicationController
  # GET /friends
  # GET /friends.json
  def index
    if params[:user_id] then
      @friends = Friend.find_all_by_user_id(params[:user_id])
    else
      @friends = Friend.find_all_by_user_id(params[:id])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    if params[:user_id] then
      @friends = Friend.find_all_by_user_id(params[:user_id])
    else
      @friends = Friend.find_all_by_user_id(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friends }
    end
  end

  # POST /friends/1/applicate
  def applicate
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:user_id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:user_id],params[:other_user_id])

    if @friend_1.status == "applicated" then
      @friend_1.status = "friend"
      @friend_1.save
      @friend_2.status = "friend"
      @friend_2.save
    elsif @friend_1.status != "friend" && @friend_1.status != "applicating" then
      @friend_1.status = "applicating"
      @friend_1.save
      @friend_2.status = "applicated"
      @friend_2.save
    end
  end

  # POST /friends/1/accept
  def accept
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:user_id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:user_id],params[:other_user_id])

    if @friend_1.status == "applicated" && @friend_2.status == "applicating" then
      @friend_1.status = "friend"
      @friend_1.save
      @friend_2.status = "friend"
      @friend_2.save
    end
  end

  # POST /friends/1/block
  def block
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:user_id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:user_id],params[:other_user_id])

    @friend_1.status = "blocking"
    @friend_1.save
    @friend_2.status = "blocked"
    @friend_2.save
  end

  # POST /friends/1/cancel
  def cancel
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:user_id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:user_id],params[:other_user_id])

    if @friend_1.status == "applicating" && @friend_2.status == "applicated" then
      @friend_1.status = ""
      @friend_1.save
      @friend_2.status = ""
      @friend_2.save
    end
  end

  # POST /friends/1/remove
  def remove
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:user_id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:user_id],params[:other_user_id])

    if @friend_1.status == "friend" && @friend_2.status == "friend" then
      @friend_1.destroy
      @friend_2.destroy
    end

    @friends = Friend.find_all_by_user_id(params[:user_id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friends }
    end
  end

end
