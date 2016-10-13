class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :commenttable_id
      t.string :commenttable_type
      t.string :comment

      t.timestamp
    end
  end
end
