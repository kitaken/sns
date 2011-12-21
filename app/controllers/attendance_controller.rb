class AttendancesController < ApplicationController
  before_filter :authenticate_user!
  def new
    create
  end
  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.find(:first,:user_id=>current_user.id,:event_id=>params[:event_id]) || Attendance.new(params[:attendance])
    @attendance.user_id => current_user.id
    @attendance.event_id=> params[:event_id]

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to event_path(params[:event_id]), notice: 'Attendance was successfully created.' }
        format.json { render json: @attendance, status: :created, location: @attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendances/1
  # PUT /attendances/1.json
  def update
    @attendance = Attendance.find(params[:id])
    @attendance.user_id = current_user.id

    respond_to do |format|
      if @attendance.update_attributes(params[:attendance])
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendances/1
  # DELETE /attendances/1.json
  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy

    respond_to do |format|
      format.html { redirect_to attendances_url }
      format.json { head :ok }
    end
  end
end
