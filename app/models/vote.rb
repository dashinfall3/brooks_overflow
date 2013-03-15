# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  voteable_id   :integer
#  voteable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ActiveRecord::Base
  attr_accessible :user_id, :value
  belongs_to :voteable, :polymorphic => true
  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:voteable_id , :voteable_type]
  validates :voteable, :presence => true
end
