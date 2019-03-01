class CalendarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def index # RJ added this controller when trying to integrate calendar into app.
    @goals = Goal.where(user: current_user)
    @tasks = Task.where(user: current_user)
  end

  def show
    @date = Time.parse(params[:id]) || Time.now
    @tasks = Task.all
  end
end
