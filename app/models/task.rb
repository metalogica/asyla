class Task < ApplicationRecord
  belongs_to :goal
  has_many :records
  belongs_to :user
end
