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
    generate_task_template(@user)
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

  def generate_task_template(user)
    categories = ["Employment", "Legal", "Medical"]

    categories.each do |type|
      category = Category.where(name: type)
      goal = Goal.new(name: category.name,
        category_id: category.ids[0],
        user_id: user.id)
      goal.save!
      Task.create!(
        title: "Test Task",
        user_id: user.id,
        goal_id: goal.id
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
