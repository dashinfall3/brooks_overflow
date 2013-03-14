class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id
  belongs_to :question
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :question_id, :presence => true

  # scope :vote_sort, Answer.select("answers.*, COUNT(votes.id)").joins(:votes).group(answers.*).order("votes.id")
  scope :vote_sort, Answer.order("winner DESC , vote_count DESC")
end
