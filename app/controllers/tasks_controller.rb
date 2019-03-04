class TasksController < ApplicationController
  def index
    if params[:name].nil?
      @tasks = Task.where(user: current_user)
    else
      @tasks = filter(params[:name])
    end
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
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

  def filter(name)
    @tasks = Task.where(user: current_user)
    @tasks_filtered = @tasks.select { |task| task.goal.name == name }
  end
end
