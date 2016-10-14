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
end
