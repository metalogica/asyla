class Record < ApplicationRecord
  belongs_to :task
  belongs_to :user

  mount_uploader :attachment, PhotoUploader
end
