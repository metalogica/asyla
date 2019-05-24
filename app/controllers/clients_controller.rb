require 'date'
require "yaml"

class ClientsController < ApplicationController
  before_action :client_notifications

  def index
    @users = User.where(admin: nil)
    admin_calendar  #  found in ApplicationController, assigns @tasks and @date
  end

  def show
    @user = User.find(params[:id].to_i)
    admin_calendar
    @tasks = Task.where(user: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # generate_task_template(@user)
    generate_user_schedule(user_params)
    redirect_to(clients_path)
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

  # Ancilliary creation methods
  def assign_goal_to_user(user, categories_hash)
    categories_hash.each do |goal_name, category|
      goal = Goal.new(category: category)
      goal.assign_attributes(name: goal_name, user: user)
      goal.save!
    end
    user.save!
    puts "... #{user.full_name} successfully created."
  end

  def assign_employment_tasks(goal, yaml_file)
    yaml_file["employment_tasks"].each do |task|
      task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
      deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
      start = deadline if deadline < Time.now
      completed = true if deadline < Time.now
      task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
      task_object.save!
      if task["records"].present?
        task["records"].each do |record|
          Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
        end
      end
    end
    puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
  end

  def assign_legal_tasks(goal, yaml_file)
    yaml_file["legal_tasks"].each do |task|
      task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
      deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
      start = deadline if deadline < Time.now
      completed = true if deadline < Time.now
      task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
      task_object.save!
      if task["records"].present?
        task["records"].each do |record|
          Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
        end
      end
    end
    puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
  end

  def assign_medical_tasks(goal, yaml_file)
    yaml_file["medical_tasks"].each do |task|
      task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
      deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
      start = deadline if deadline < Time.now
      completed = true if deadline < Time.now
      task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
      task_object.save!
      if task["records"].present?
        task["records"].each do |record|
          Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
        end
      end
    end
    puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
  end

  # Core Creation method
  def generate_user_schedule(user_params)
    puts "Fetching YAML file..."
    file = YAML.load(File.read(Rails.root + 'db/seed-structure.yml'))

    puts "Creating categories..."
    categories = {}  # slug => Category
    file["categories"].each do |category|
      categories[category["slug"]] = Category.create!(category.slice("name", "colour"))
    end

    puts "Creating users..."
    users = {}  # slug => User
    @user = User.new({
      first_name: user_params[:first_name],
      last_name: user_params[:last_name],
      email: user_params[:email],
      password: user_params[:password],
      age: user_params[:age],
      nationality: user_params[:nationality],
      language: user_params[:language],
      address: user_params[:address],
      photo: user_params[:avatar],
      avatar: user_params[:avatar],
      intake_date: '2019-05-24'
    })
    users[user_params[:first_name]] = @user

    puts "Assigning goals to users..."
    users.each do |user_name, user_object|
      assign_goal_to_user(user_object, categories) # This method saves users and goals together.
    end

    puts "Creating tasks"
    employment_tasks = {}  # slug => Goal
    file["employment_tasks"].each do |task|
      employment_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
    end
    legal_tasks = {}  # slug => Goal
    file["legal_tasks"].each do |task|
      legal_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
    end
    medical_tasks = {}  # slug => Goal
    file["medical_tasks"].each do |task|
      medical_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
    end

    puts "<---Assigning tasks to users... Geocoding API for address may take a few seconds to load... --->"
    users.each do |user_name, user_object|
      user_object.goals.each do |goal|
        case goal.name
        when "employment"
          assign_employment_tasks(goal, file)
        when "legal"
          assign_legal_tasks(goal, file)
        when "medical"
          assign_medical_tasks(goal, file)
        end
      end
    end
    puts "<---Assigned all tasks for all users!--->"
  end
end
