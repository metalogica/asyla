class Task < ApplicationRecord
  belongs_to :goal
  has_many :records
end
