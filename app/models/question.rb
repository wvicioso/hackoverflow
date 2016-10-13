class Question < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_one :best_answer, class_name: 'Answer', foreign_key: :id
  # Remember to create a migration!

end
