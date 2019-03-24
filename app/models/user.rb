class User < ApplicationRecord
  has_many :messages
  has_many :conversations
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
