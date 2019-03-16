class TaskMailer < ApplicationMailer
  def creation_confirmation(task)
    @task= restaurant

    mail(
      to: @task.user.email,
      subject: "Task: '#{@task.name}' has been created!",
      :track_opens => 'true'
    )
  end
end
