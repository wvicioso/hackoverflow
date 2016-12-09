class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.integer :views, :default => 0, null: false
      t.integer :best_answer_id

      t.timestamps(null: false)
    end
  end
end
