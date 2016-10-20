class CreateProductinformations < ActiveRecord::Migration
  def change
    create_table :productinformations do |t|
    	t.float :length
    	t.float :width
    	t.float :height
    	t.float :productweight
    	t.float :shippingweight
      t.timestamps null: false
    end
  end
end
