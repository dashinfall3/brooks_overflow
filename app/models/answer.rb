class Answer < ActiveRecord::Base
  attr_accessible :content, :user_id, :question_id
  belongs_to :question
  belongs_to :user
  has_many :comments, :as => :commentable
  has_many :votes, :as => :voteable
end
