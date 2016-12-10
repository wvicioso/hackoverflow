class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.references :commentable, polymorphic: true, index: true, null: false
      t.string :body, null: false

      t.timestamps(null: false)
    end

  end
end
