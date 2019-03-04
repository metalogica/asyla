class TasksController < ApplicationController
  def index
    # Client Calendar logic
    @tasks = Task.where(user: current_user)
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end

    # Admin specific logic
    if current_user.admin
      @tasks = Task.all
    end
  end

  def show
    # Client Calendar logic
    @tasks = Task.where(user: current_user)
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end

    # Admin specific logic
    if current_user.admin
      @tasks = Task.all
      # task_dates = Task.pluck(:deadline) # Get all task deadlines
      # task_dates.map(&:day) # Convert deadlien dates into day integer
      @daily_tasks = []
      @tasks.each do |task|
        @daily_tasks << task if task.deadline.day == params[:id].to_i
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def intake
    @temp = "temp"
  end

  def calendar
    @tasks = Task.where(user: current_user)
  end

  def map
    # Used for showing all tasks.
    # @tasks = Task.where.not(latitude: nil, longitude: nil)

    # Used for 'show single task on map'
    @tasks = []
    @tasks << Task.find(params[:task_id])

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
    @markers = @tasks.map do |task|
      {
        lng: task.longitude,
        lat: task.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { task: task })
      }
    end
  end
end
