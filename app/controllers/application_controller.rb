class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def admin_calendar
    if params[:name].nil?
      @tasks = Task.all
    else
      @tasks = filter(params[:name])
    end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def client_calendar
    if params[:name].nil?
      @tasks = Task.where(user: current_user)
    else
      @tasks = filter(params[:name])
    end

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
  end

  def client_notifications
    @alerts = Notification.all
  end
end
