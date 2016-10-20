class DeleteShippingWeightColumn < ActiveRecord::Migration
  def change
  	remove_column :productinformations, :shippingweight
  end
end
