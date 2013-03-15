# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  content    :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  validates :content, :presence => true
  validates :user_id, :presence => true

  def has_winner?
  	self.answers.where('winner = ?', true).count > 0 ? true : false
  end
end
