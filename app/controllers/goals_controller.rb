class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :render_calendar] #Delete this when we build devise functionality.

  def index
    @goals = Goal.all
    @tasks = Task.all
  end



  def show
  end


 
end
