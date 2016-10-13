class CreateAnswers < ActiveRecord::Migration
  def change
    create_tabe :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :answer

      t.timestamp
    end
  end
end
