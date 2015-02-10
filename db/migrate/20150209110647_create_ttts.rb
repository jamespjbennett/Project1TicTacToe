class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.integer :player_one
      t.integer :user_id
      t.integer :computer
      t.integer :move
      t.timestamps null: false
    end
  end
end
