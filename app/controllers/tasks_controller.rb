class TasksController < ApplicationController
  def index
    if params[:name].nil?
      @tasks = Task.where(user: current_user)
    else
      @tasks = filter(params[:name])
    end
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end

    # Admin specific logic
    if current_user.admin
      @goals = Goal.all
      @users = User.all
      @tasks = Task.all
    end
  end

  def show
    # Client Calendar logic
    @tasks = Task.where(user: current_user)
    # where(user: current_user)

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end

    # Admin specific logic
    if current_user.admin
      @tasks = Task.all
      # task_dates = Task.pluck(:deadline) # Get all task deadlines
      # task_dates.map(&:day) # Convert deadlien dates into day integer
      @daily_tasks = []
      @current_month = params[:references] # date object from calendar partial.
      @tasks.each do |task|
        if task.deadline.day == params[:id].to_i
          @daily_tasks << task if task.deadline.month == Date.parse(params[:references]).month
        end
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to("tasks")
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to(task_path(@task))
    else
      render("tasks/edit")
    end
  end

  def destroy
    task = Task.find(params[:id].to_i)
    task.destroy
    redirect_to(tasks_path)
  end

  def intake
    @temp = "temp"
  end

  def calendar
    @tasks = Task.where(user: current_user)
  end

  def map
    # Used for showing all tasks.
    # @tasks = Task.where.not(latitude: nil, longitude: nil)

    # Used for 'show single task on map'
    @tasks = []
    @tasks << Task.find(params[:task_id])

    if params[:date].nil?
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end
    @markers = @tasks.map do |task|
      {
        lng: task.longitude,
        lat: task.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { task: task })
      }
    end
  end

  def filter(name)
    @tasks = Task.where(user: current_user)
    @tasks_filtered = @tasks.select { |task| task.goal.name == name }
  end

  private

  def task_params
    params.require(:task).permit(:title, :address, :details, :completed, :goal, :user)
  end
end
