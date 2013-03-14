class Comment < ActiveRecord::Base
  attr_accessible :content
  belongs_to :commentable, :polymorphic => true
  has_many :votes, :as => :voteable

  validates :content, :presence => true
  validates :commentable, :presence => true
end
