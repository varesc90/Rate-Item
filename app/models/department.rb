class Department < ActiveRecord::Base
	validates(:departmentname, presence: true)
	validates(:departmentname, uniqueness: true)
	has_many(:subdepartments)
	accepts_nested_attributes_for :subdepartments
end
