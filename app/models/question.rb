class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_one :best_answer, class_name: 'Answer', foreign_key: :id

  validates :user_id, :title, :body, presence: true

  def type
    "questions"
  end
end
