# == Schema Information
#
# Table name: films
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Film < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :categories

  validates_associated :categories
  validates :title, :description, presence: true
  validates_presence_of :categories, :message => "not found"
end
