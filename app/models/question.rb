class Question < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  has_many :answers
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable

  def has_winner?
  	self.answers.where('winner = ?', true).count > 0 ? true : false
  end
end
