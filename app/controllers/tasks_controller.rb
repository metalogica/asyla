class TasksController < ApplicationController
  def index
    # Client Calendar
    unless current_user.admin
      client_calendar
    end

    # Admin specific logic
    if current_user.admin
      @tasks = Task.all
      admin_calendar
    end
  end

  def show
    # Client Calendar logic
    unless current_user.admin
      client_calendar
    end

    # Admin specific logic
    if current_user.admin
      admin_calendar
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
    @goals = Goal.all
    @users = User.all
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

  private

  def filter(name)
    @tasks = Task.where(user: current_user)
    @tasks_filtered = @tasks.select { |task| task.goal.name == name }
  end

  def task_params
    params.require(:task).permit(:title, :address, :details, :completed, :goal, :user)
  end
end
