class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals
  has_many :tasks

  mount_uploader :avatar, PhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
