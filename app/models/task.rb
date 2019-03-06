class Task < ApplicationRecord
  belongs_to :goal
  belongs_to :user
  has_many :records

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
