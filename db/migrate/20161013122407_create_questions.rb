class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.string :question
      t.integer :views
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
