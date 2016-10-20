class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :result
      t.integer :user_id
      t.integer :product_id
      t.text :comment
      t.timestamps null: false
    end
  end
end
