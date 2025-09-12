class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true
end
