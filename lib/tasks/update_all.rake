namespace :task do
  desc "Test sidekiq by processing all tasks."
  task :update_all => :environment do
    tasks = Task.all
    puts "Enqueuing update of #{tasks.size} tasks..."
    tasks.each do |task|
      UpdateTaskJob.perform_later(task.id)
    end
    # rake task will return when all jobs are _enqueued_ (not done).
  end
end
