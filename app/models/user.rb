class User < ActiveRecord::Base
  attr_accessible :email, :password, :username
  has_secure_password
  has_many :questions
  has_many :answers
  has_many :votes

  validates :email, 
  			:presence => true,
  			:format => {:with => /^[\w+\=.]+@[a-z\d\=.]+\.[a-z]+$/i},
  			:uniqueness => {:case_sensitive => false}
  validates :username, 
  			:presence => true,
  			:format => {:with => /^[A-Za-z0-9_]+$/},
  			:uniqueness => {:case_sensitive => false},
        :length => {minimum: 6}
  validates :password,
        :presence => true,
        :length => {minimum: 6}
end
