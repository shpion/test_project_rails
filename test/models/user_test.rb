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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
