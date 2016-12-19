class Question < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :best_answer, class_name: 'Answer', foreign_key: :id, dependent: :destroy

  validates :user_id, :title, :body, presence: true

  def type
    "questions"
  end
end
