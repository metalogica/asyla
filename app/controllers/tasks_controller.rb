class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def calendar
  end

  def map
    @tasks = Task.where.not(latitude: nil, longitude: nil)

    @markers = @tasks.map do |task|
      {
        lng: task.longitude,
        lat: task.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { task: task })
      }
    end
  end
end
