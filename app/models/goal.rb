class Goal < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :tasks

  def user_goals
    "#{self.name} - #{self.user.full_name}"
  end
end
