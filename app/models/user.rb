class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy

  after_create :send_welcome_email # Turn off when seeding.
  after_create :subscribe_to_newsletter # Turn off when seeding.

  mount_uploader :avatar, PhotoUploader

  acts_as_token_authenticatable

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_later
  end
end
