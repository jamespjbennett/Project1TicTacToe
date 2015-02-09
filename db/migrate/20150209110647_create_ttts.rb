class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.integer :player_one
      t.integer :player_two
      t.integer :computer

      t.timestamps null: false
    end
  end
end
