class Comment < ApplicationRecord
  belongs_to :film
  belongs_to :user

  # validates_associated :user, :film
  # validates :comment, :user, presence: true
end
