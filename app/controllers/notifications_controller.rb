class NotificationsController < ApplicationController
  def create
    head(:no_content)
    @notification = Notification.new(user_id: params[:user_id], task_id: params[:task_id], problem: params[:problem])
    @notification.save
  end

  def destroy
    notification = Notification.find(params[:id])
    notification.destroy
    redirect_to(request.referrer)
  end
end
