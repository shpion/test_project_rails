# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  comment    :text
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  film_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_comments_on_film_id  (film_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  belongs_to :film
  belongs_to :user

  validates_associated :user, :film
  validates :comment, :user, presence: true
end
