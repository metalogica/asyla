class NotificationsController < ApplicationController
  def create
    @notification = Notification.new(notification_params)
    @notification.save
  end

  private

  def notification_params
    params.require(:notification).permit(:user_id, :task_id, :problem)
  end
end
