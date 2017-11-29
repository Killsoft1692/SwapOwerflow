# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  response    :text
#  likes       :integer          default(0)
#  confirmed   :boolean
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
