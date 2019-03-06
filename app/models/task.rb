class Task < ApplicationRecord
  belongs_to :goal, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :records, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
