class Task < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  has_many :records, dependent: :destroy
  has_many :notifications, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_save :async_update # sidekiq test

  def async_update
    # sidekiq test
    UpdateTaskJob.perform_later(self.id)
  end
end
