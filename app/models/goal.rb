class Goal < ApplicationRecord
  belongs_to :category
  belongs_to :user, dependent: :destroy
  has_many :tasks, dependent: :destroy

  def user_goals
    "#{self.name} - #{self.user.full_name}"
  end
end
