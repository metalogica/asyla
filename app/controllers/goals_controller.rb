class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] #Delete this when we build devise functionality.

  def index
    # I want to get goals for a specific user for displaying them
    @goals = Goal.where(user: current_user)
  end

  def show
    # I want to show the specific tasks for a particular goal
  end
end
