# == Schema Information
#
# Table name: users
#
#  id                       :bigint           not null, primary key
#  deleted_at               :datetime
#  email                    :string
#  name                     :string
#  password                 :string
#  password_digest          :string
#  recovery_password_digest :string
#  type_mask                :integer          default(1), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#
class User < ApplicationRecord
  has_secure_password :validations => false
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :email, uniqueness: true, allow_blank: true, presence: false
end
