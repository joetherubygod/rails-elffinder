class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  validates :name, :email, :password, :password_confirmation, presence: true
  validates :name, :email, :password, length: { in: 3..20 }
  validates :email, uniqueness: true
end
