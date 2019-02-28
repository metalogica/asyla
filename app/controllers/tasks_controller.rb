class TasksController < ApplicationController
  def index
    @tasks = Task.where(user: current_user)
  end

  def calendar
  end
end
