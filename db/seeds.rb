require 'date'
require "yaml"

puts 'Cleaning database...'
Record.destroy_all
Task.destroy_all
Goal.destroy_all
Category.destroy_all
User.destroy_all

def assign_goal_to_user(user, categories_hash)
  categories_hash.each do |goal_name, category|
    goal = Goal.new(category: category)
    goal.assign_attributes(name: goal_name, user: user)
    goal.save!
  end
  user.save!
  puts "... #{user.full_name} successfully created."
end

def assign_employment_tasks(goal, yaml_file)
  yaml_file["employment_tasks"].each do |task|
    task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
    deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
    start = deadline if deadline < Time.now
    completed = true if deadline < Time.now
    task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
    task_object.save!
    if task["records"].present?
      task["records"].each do |record|
        Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
      end
    end
  end
  puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
end

def assign_legal_tasks(goal, yaml_file)
  yaml_file["legal_tasks"].each do |task|
    task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
    deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
    start = deadline if deadline < Time.now
    completed = true if deadline < Time.now
    task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
    task_object.save!
    if task["records"].present?
      task["records"].each do |record|
        Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
      end
    end
  end
  puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
end

def assign_medical_tasks(goal, yaml_file)
  yaml_file["medical_tasks"].each do |task|
    task_object = Task.new(task.slice("title", "details", "completed", "address", "deadline"))
    deadline = goal.user.intake_date.next_day(task.slice("timeframe").values[0]) # Get deadline in days from user intake date.
    start = deadline if deadline < Time.now
    completed = true if deadline < Time.now
    task_object.assign_attributes(goal: goal, user: goal.user, deadline: deadline, start: start, completed: completed)
    task_object.save!
    if task["records"].present?
      task["records"].each do |record|
        Record.create!(title: record["title"], photo: record["photo"], task: task_object, user: goal.user)
      end
    end
  end
  puts "... Successfully assigned #{goal.name} tasks for #{goal.user.full_name}"
end

puts "Fetching YAML file..."
file = YAML.load(File.read("db/seed-structure.yml"))

puts "Creating admin account..."
admin = User.create!(first_name: 'John', last_name: 'Doe', age: 99, nationality: 'Planet Earth', language: 'English', address: 'Planet Earth', email: 'admin@asyla.ca', password: 'lewagon', admin: true, photo: "https://res.cloudinary.com/dtmuylvrr/image/upload/v1550859374/bzlzuwmpptyakvmojfqk.jpg")

puts "Creating categories..."
categories = {}  # slug => Category
file["categories"].each do |category|
  categories[category["slug"]] = Category.create!(category.slice("name", "colour"))
end

puts "Creating users..."
users = {}  # slug => User
file["users"].each do |user|
  users[user["slug"]] = User.new(user.slice("first_name", "last_name", "age", "nationality", "language", "address", "email", "password", "photo", "intake_date"))
end

puts "Assigning goals to users..."
users.each do |user_name, user_object|
  assign_goal_to_user(user_object, categories) # This method saves users and goals together.
end

puts "Creating tasks"
employment_tasks = {}  # slug => Goal
file["employment_tasks"].each do |task|
  employment_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
end
legal_tasks = {}  # slug => Goal
file["legal_tasks"].each do |task|
  legal_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
end
medical_tasks = {}  # slug => Goal
file["medical_tasks"].each do |task|
  medical_tasks[task["slug"]] = Task.new(task.slice("title", "details", "completed", "address", "deadline", "start"))
end

puts "<---Assigning tasks to users... Geocoding API for address may take a few seconds to load... --->"
users.each do |user_name, user_object|
  user_object.goals.each do |goal|
    case goal.name
    when "employment"
      assign_employment_tasks(goal, file)
    when "legal"
      assign_legal_tasks(goal, file)
    when "medical"
      assign_medical_tasks(goal, file)
    end
  end
end
puts "<---Assigned all tasks for all users!--->"

puts "Creating notifications..."
task_array = Task.all
task_sample = task_array.sample(7)
problem = [true, false]
task_sample.each { |task| Notification.create!(problem: problem[rand(0..1)], task_id: task.id, user_id: task.user.id) }

puts "<--- Successfully Completed Seed! --->"




