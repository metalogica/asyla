class Api::V1::TasksController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_task, only: [ :show, :update, :destroy]

  def index
    @tasks = policy_scope(Task)
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    authorize(@task)
    if @task.save
      render :show, status: :created
    else
      render_error
    end
  end

  def show
  end

  def update
    if @task.update(task_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.require(:task).permit(:title, :completed, :deadline, :address, :user_id, :goal_id)
  end

  def set_task
    @task = Task.find(params[:id].to_i)
    authorize(@task)
  end
end
