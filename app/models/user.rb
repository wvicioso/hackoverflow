require 'bcrypt'

class User < ActiveRecord::Base
  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments

  has_secure_password

  validates :email, :password_digest, :username, presence: true
  validates :password, length: { minimum: 6 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, uniqueness: true
  before_save :check_username

  def check_username
    User.all.select {|user| user.username.downcase == self.username}[0] || false
  end

  def reputation
    question = 0
    answer = 0
    question = self.questions.reduce(0) {|sum, item| sum + item.votes.length} if self.questions
    answer = self.answers.reduce(0) {|sum, item| sum + item.votes.length} if self.answers
    answer + question
  end
end
