class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.string :title
      t.string :body
      t.integer :views, :default => 0
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
