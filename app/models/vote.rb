class Vote < ActiveRecord::Base
  attr_accessible :user_id
  belongs_to :voteable, :polymorphic => true
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:voteable_id , :voteable_type]
  validates :voteable, :presence => true
end
