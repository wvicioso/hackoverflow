class CreateVotes < ActiveRecord::Migration
  def change
    create_tabe :votes do |t|
      t.integer :user_id
      t.integer :votable_id
      t.string :votable_type
      t.binary :up_down
      
      t.timestamp
    end
  end
end
