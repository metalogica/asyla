class NotificationsController < ApplicationController
  def create
    @notification = Notification.new(user_id: params[:user_id], task_id: params[:task_id], problem: params[:problem])
    @notification.save
  end
end
