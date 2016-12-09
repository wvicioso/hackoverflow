class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :user_id, :question_id, :body, presence: true

  def type
    "answers"
  end

  def classname

  end
end
