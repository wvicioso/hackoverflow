require 'bcrypt'

class User < ActiveRecord::Base
  has_many :votes
  has_many :questions
  has_many :answers
  has_many :comments

  has_secure_password
  # Remember to create a migration!



  def validate(pass)
    self.password_digest == pass
  end


  def reputation
    q = 0
    a = 0
    q = self.questions.reduce(0) {|sum, item| sum + item.votes.length} if self.questions
    a = self.answers.reduce(0) {|sum, item| sum + item.votes.length} if self.answers
    a + q
  end
end
