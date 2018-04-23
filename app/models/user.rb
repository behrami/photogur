class User < ApplicationRecord
  has_secure_password

  has_many :pictures

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
