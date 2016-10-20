class CreateItems < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :product_name
    	t.text :productdescription
    	t.integer :productinformation_id
    	t.integer :user_id
    	t.integer :subdepartment_id
      t.timestamps null: false
    end
  end
end
