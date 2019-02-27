class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] #Delete this when we build devise functionality.

  def index
    @tasks = Task.where(user: current_user)
  end

end
