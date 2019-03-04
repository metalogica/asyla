class TasksController < ApplicationController
  def index
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
    end
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  # def intake
  #   @user = user.find(params:[:id])
  #   default_client(@user)
  # end

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

  # def default_client

  #   goal_employment = Goal.create!(name: 'Employment', category: category_employment, user: , completed: false)
  #   goal_legal = Goal.create!(name: 'Legal', category: category_legal, user: fouzia, completed: false)
  #   goal_medical = Goal.create!(name: 'Medical', category: category_medical, user: fouzia, completed: false)
  #   Task.create!(goal: medical, title: 'Intake appointment', start: nil, end: nil, deadline: DateTime.now.next_day(40), details: nil, completed: false, address: nil, user: goal.user)
  # end

end
