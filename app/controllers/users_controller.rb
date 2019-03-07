class UsersController < ApplicationController
  before_action :authorize_admin, only: :create

  def new
    @user = User.new
    goal_education = Goal.new(category: category_education, )
  end

  def create

  end

  private

  def authorize_admin
    return if current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end
end
