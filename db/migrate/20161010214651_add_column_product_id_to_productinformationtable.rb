class AddColumnProductIdToProductinformationtable < ActiveRecord::Migration
  def change
  	add_column :productinformations, :product_id, :integer
  end
end
