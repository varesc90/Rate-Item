class RemoveProductinformationIdColumn < ActiveRecord::Migration
  def change
  	remove_column :products, :productinformation_id
  end
end
