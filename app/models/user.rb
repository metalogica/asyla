class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create :send_welcome_email
  after_create :subscribe_to_newsletter

  mount_uploader :avatar, PhotoUploader

  private

  def full_name
    "#{first_name} #{last_name}"
  end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
