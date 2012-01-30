#coding: utf-8
class LettersController < ApplicationController
  before_filter :authenticate_user!
  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.all
    @letter = Letter.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @letters }
    end
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
    @letter = Letter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @letter }
    end
  end
  # GET /letters/new
  # GET /letters/new.json
  def new
    @letter = Letter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @letter }
    end
  end
  # GET /letters/1/edit
  def edit
    @letter = Letter.find(params[:id])
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(params[:letter])
    @letter.sender_id = current_user.id

    respond_to do |format|
      if @letter.save
        format.html { redirect_to conversation_path(:id=>@letter.receiver_id), notice: 'メッセージの送信を完了しました。' }
        format.json { render json: @letter, status: :created, location: @letter }
      else
        format.html { render action: "new" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /letters/1
  # PUT /letters/1.json
  def update
    @letter = Letter.find(params[:id])
    respond_to do |format|
      if @letter.update_attributes(params[:letter])
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy

    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :ok }
    end
  end
end
