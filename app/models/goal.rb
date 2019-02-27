class Goal < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :tasks
end
