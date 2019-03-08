class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

def default_url_options
  { host: ENV["HOST"] || "localhost:3000" }
end
  def admin_calendar

    @new_user = User.new
    @tasks = Task.all

    @filter = params[:filter] || "none"
    unless @filter == "none"
      @tasks = filter(@filter)
    end

    # unless params[:user_filter_schedule].nil?
    #   @tasks = user_filter_schedule(params[:user_filter_schedule])
    # end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def client_calendar
    @tasks = Task.where(user: current_user)

    @filter = params[:filter] || "none"
    unless @filter == "none"
      @tasks = filter(@fitler)
    end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  # def user_filter_schedule(user)
  #   @user_tasks = @tasks.select { |task| task.user.id == user }
  # end

  private

  def filter(name)
    @tasks_filtered = @tasks.select { |task| task.goal.name == name }
  end

  def client_notifications
    @alerts = Notification.all
  end
end
