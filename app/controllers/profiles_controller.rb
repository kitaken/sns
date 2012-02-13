class ProfilesController < ApplicationController
  before_filter :authenticate_user!
  # GET /profiles
  # GET /profiles.json
  
  def index
    redirect_to root_url
  #  @profiles = Profile.all

  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @profiles }
  #  end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    @friend = Friendship.find_by_user_id_and_friend_id(current_user.id, @profile.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  #
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    if current_user.id == params[:id].to_i
      @profile = Profile.find(params[:id])
    else
      redirect_to profile_url(params[:id])
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])
    if @profile.user_id != current_user.id
      redirect_to @profile, notice:'You dont have a permission'
    end

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  #
  def destroy
    @profile = Profile.find_by_user_id(params[:user_id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end
end
