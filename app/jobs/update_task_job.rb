class UpdateTaskJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find(task_id)
    puts "Calling fake job for #{task.user.full_name}..."
    # TODO: perform a time consuming task like Clearbit's Enrinchment API.
    sleep 1
    puts "Done! Fake job preformed. Sidekiq is working correctly."
  end
end
