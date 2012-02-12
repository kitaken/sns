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

  # POST /friends/applicate
  def applicate
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:id],params[:other_user_id])

    if @friend_1 == nil || @friend_2 == nil then
      @friend_1 = Friend.new(
                             :user_id       => params[:id],
                             :other_user_id => params[:other_user_id],
                             :status        => "applicating"
                             )
      @friend_2 = Friend.new(
                             :user_id       => params[:other_user_id],
                             :other_user_id => params[:id],
                             :status        => "applicated"
                             )
    elsif @friend_1.status != "friend" && @friend_1.status != "applicating" then
      @friend_1.status = "applicating"
      @friend_2.status = "applicated"
    end

    @friend_1.save
    @friend_2.save

    @friends = Friend.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :action => "index", :json => @friends }
    end
  end

  # POST /friends/accept
  def accept
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:id],params[:other_user_id])

    if @friend_1 != nil && @friend_2 != nil then
      if @friend_1.status == "applicated" && @friend_2.status == "applicating" then
        logger.debug "test!"

        @friend_1.status = "friend"
        @friend_2.status = "friend"
        @friend_1.save
        @friend_2.save
      end
    end


    @friends = Friend.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :action => "index", :json => @friends }
    end
  end

  # POST /friends/block
  def block
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:id],params[:other_user_id])

    if @friend_1 == nil || @friend_2 == nil then
      @friend_1 = Friend.new(
                             :user_id       => params[:id],
                             :other_user_id => params[:other_user_id],
                             :status        => "blocking"
                             )
      @friend_2 = Friend.new(
                             :user_id       => params[:other_user_id],
                             :other_user_id => params[:id],
                             :status        => "blocked"
                             )
    else
        @friend_1.status = "blocking"
        @friend_2.status = "blocked"
    end

    @friend_1.save
    @friend_2.save

    @friends = Friend.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :action => "index", :json => @friends }
    end
  end

  # POST /friends/cancel
  def cancel
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:id],params[:other_user_id])

    if @friend_1 != nil && @friend_2 != nil then
      if @friend_1.status1 == "blocking" && @friend_2.status == "blocked" then
        @friend_1.destroy
        @friend_2.destroy
      end
    end

    @friends = Friend.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :action => "index", :json => @friends }
    end
  end

  # POST /friends/remove
  def remove
    @friend_1 = Friend.find_by_user_id_and_other_user_id(params[:id],params[:other_user_id])
    @friend_2 = Friend.find_by_other_user_id_and_user_id(params[:id],params[:other_user_id])

    if @friend_1.status != nil && @friend_2.status != nil then
      @friend_1.destroy
      @friend_2.destroy
    end

    @friends = Friend.find_all_by_user_id(params[:id])
    respond_to do |format|
      format.html { render :action => "index" }
      format.json { render :action => "index", :json => @friends }
    end
  end

end
