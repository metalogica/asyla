class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] #Delete this when we build devise functionality.

  def index
    # I want to get goals for a specific user to be able to display them
    @goals = Goal.where(user: current_user)
    # I want to count the number of completed tasks for each goal
    @dashboard = dashboard_hash
  end

  def dashboard_hash
    dashboard = []

    @goals.each do |goal|
      goals_hash = {
        goal_name: goal.name,
        total_tasks: goal.tasks.size,
        completed_tasks: count_tasks_completed,
        progress: count_tasks_completed / goal.tasks.size
      }

      dashboard << goals_hash
    end
    dashboard
  end


  def count_tasks_completed
    @goals.each do |goal|
      completed_tasks = goal.tasks.select { |task| task.completed == true }
      return completed_tasks.count
    end
  end

  # def count_total_tasks_completed_per_goal
  #   count = 0
  #   @goals.each do |goal|
  #     goal.tasks.each do |task|
  #       count += 1 if task.completed == true
  #     end
  #   end
  #   return count
  # end

  # def count_total_tasks_per_goal
  #   @goals.each do |goal|
  #     total = goal.tasks.size
  #   end
  #   return total
  # end


  def show
    # I want to show the specific tasks for a particular goal
  end
end

