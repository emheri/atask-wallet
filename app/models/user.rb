class User < ApplicationRecord
  has_one :wallet, as: :entityable, dependent: :destroy

  validates :email, presence: true, uniqueness: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }

  has_secure_password
end
