class AddAttachmentProductPicToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :product_pic
    end
  end

  def self.down
    remove_attachment :products, :product_pic
  end
end
