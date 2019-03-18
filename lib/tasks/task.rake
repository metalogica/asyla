namespace :task do
  desc "Test sidekiq by processing all tasks."
  task :update, [:task_id] => :environment do |t, args|
    task = Task.find(args[:task_id])
    puts "Fetching #{task.title}..."
    UpdateTaskJob.perform_later(task.id)
    # rake task will return when job is _done_
  end
end
