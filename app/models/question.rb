class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_one :best_answer, class_name: 'Answer', foreign_key: :id
  # Remember to create a migration!

def view
	@views += 1
end

end
