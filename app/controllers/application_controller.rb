class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def admin_calendar
    @tasks = Task.all

    unless params[:filter].nil?
      @tasks = filter(params[:filter])
    end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def client_calendar
    @tasks = Task.where(user: current_user)

    unless params[:filter].nil?
      @tasks = filter(params[:filter])
    end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def filter(user)
    @user_tasks = @tasks.select { |task| task.user.id == user }
  end

  private

  def filter(name)
    @tasks_filtered = @tasks.select { |task| task.goal.name == name }
  end

end
