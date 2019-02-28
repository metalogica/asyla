class TasksController < ApplicationController
  def index
    @tasks = Task.all
    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def calendar
  end
end
