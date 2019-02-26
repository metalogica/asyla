class Dependency < ApplicationRecord
  belongs_to :task
  belongs_to :depends_on_task
end
