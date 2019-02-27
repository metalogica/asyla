class Record < ApplicationRecord
  belongs_to :task
  belongs_to :user
  belongs_to :goal, through: :task
  belongs_to :category, through: :goal
end
