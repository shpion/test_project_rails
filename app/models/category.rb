# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  films_count :integer          default(0), not null
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_and_belongs_to_many :films
end
