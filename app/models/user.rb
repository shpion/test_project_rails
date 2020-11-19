class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy

  # validates :name, presence: true
  # validates :email, uniqueness: true
end
