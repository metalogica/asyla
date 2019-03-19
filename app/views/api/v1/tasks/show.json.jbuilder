json.extract! @task, :id, :title, :address, :completed
json.user @task.user, :id, :first_name, :last_name, :photo
