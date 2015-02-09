class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.integer :player_one
      t.integer :player_two
      t.integer :player_one_id , :references => :user_id
      t.integer :player_two_id , :references => :user_id
      t.integer :computer

      t.timestamps null: false
    end
  end
end
