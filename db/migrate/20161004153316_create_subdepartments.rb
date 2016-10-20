class CreateSubdepartments < ActiveRecord::Migration
  def change
    create_table :subdepartments do |t|
    	t.string :subdepartmentname
    	t.integer :department_id
      t.timestamps null: false
    end
  end
end
