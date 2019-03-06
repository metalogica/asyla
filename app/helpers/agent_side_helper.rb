module AgentSideHelper
  def count_unsheduled_tasks(user)
    number_of_tasks = user.tasks.count
    unscheduled_tasks = user.tasks.where(start: nil).count
    return "All of their tasks are scheduled." if unscheduled_tasks.zero?
    return "Of these, #{unscheduled_tasks} still need to be scheduled."
  end

  def count_uncompleted_tasks(user)
    uncompleted_tasks = user.tasks.where(completed:false).count
    return "#{user.first_name} has #{uncompleted_tasks} tasks remaining out of #{user.tasks.count}."
  end
end