# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates_presence_of :title, :body
  has_many :answers, dependent: :destroy
  belongs_to :user

  scope :hot_likes, -> {joins(:answers).where('answers.likes > ?', 0 ).order('likes DESC')}
end
