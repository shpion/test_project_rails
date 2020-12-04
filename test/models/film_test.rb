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
require 'test_helper'

class FilmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
