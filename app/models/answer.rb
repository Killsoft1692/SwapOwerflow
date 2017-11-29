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

class Answer < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :response
  belongs_to :question
  belongs_to :user
  has_many :votes, dependent: :destroy
end
