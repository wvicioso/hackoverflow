class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :question do |t|
      t.sting :title
      t.sting :question
      t.integer :views
      t.integer :answer_id

      t.timestamp
    end
  end
end
