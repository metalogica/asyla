class ClientsController < ApplicationController
  def index
    @users = User.all
    admin_calendar
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(tasks_path)
    else
      render "clients/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :avatar,
      :email,
      :password,
      :age,
      :nationality,
      :language,
      :address,
    )
  end

end
