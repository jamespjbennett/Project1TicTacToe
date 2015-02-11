class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.integer :user_id
      t.integer :computer
      t.timestamps null: false
    end
  end
end
