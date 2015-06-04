class SchedulesController < ApplicationController
  def index
    @schedules = current_user.schedules.all
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new
    @schedule.user_id = current_user.id
    @schedule.end_time = Chronic.parse(params[:end_time])
    @schedule.start_time = Chronic.parse(params[:start_time])

    if @schedule.save
      redirect_to "/schedules", :notice => "Schedule created successfully."
    else
      render 'new'
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    @schedule.user_id = current_user.id
    @schedule.end_time = Chronic.parse(params[:end_time])
    @schedule.start_time = Chronic.parse(params[:start_time])

    if @schedule.save
      redirect_to "/schedules", :notice => "Schedule updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])

    @schedule.destroy

    redirect_to "/schedules", :notice => "Schedule deleted."
  end
end
