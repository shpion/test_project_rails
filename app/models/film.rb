class Film < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories

  validates_associated :categories
  validates :title, :description, presence: true
  validates_presence_of :categories, :message => "not found"
end
