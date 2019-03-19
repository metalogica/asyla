json.array! @tasks do |task|
  json.extract! task, :id, :title, :address, :completed, :deadline
end
