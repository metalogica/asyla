class Api::V1::TasksController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_task, only: [ :show, :update ]

  def index
    @tasks = policy_scope(Task)
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

  private

  def task_params
    params.require(:task).permit(:title, :completed, :deadline)
  end

  def set_task
    @task = Task.find(params[:id].to_i)
    authorize(@task)
  end
end
