class CreateComputersandtabletcategories < ActiveRecord::Migration
  def change
    create_table :departments do |t|
    	t.string :departmentname
      t.timestamps null: false
    end
  end
end
