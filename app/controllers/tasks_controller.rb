class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user)
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
