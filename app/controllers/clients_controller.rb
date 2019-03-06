class ClientsController < ApplicationController
  before_action :client_notifications

  def index
    @users = User.where(admin: nil)
    admin_calendar  #  found in ApplicationController, assigns @tasks and @date
  end

  def show
    @user = User.find(params[:id].to_i)
    admin_calendar
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      generate_task_template(@user)
      redirect_to(clients_path)
    else
      render "clients/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    # user = User.find(params[:id].to_i)
    # user.destroy
    # redirect_to(clients_path)
  end

  private

  def generate_task_template(user)
    categories = ["Employment", "Legal", "Medical"]
    categories.each do |type|
      category = Category.where(name: type)
      goal = Goal.new(name: category[0].name,
        category_id: category.ids[0],
        user_id: user.id)
      goal.save!
      Task.create!(
        title: "Test Task",
        user_id: user.id,
        goal_id: goal.id,
        )
    end
  end

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
