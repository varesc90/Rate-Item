class Subdepartment < ActiveRecord::Base
	# validates(:subdepartmentname, presence: {message: 'has to be there, what are you doing?!'}, uniqueness: true)
	belongs_to(:department)
	has_many(:products)
end
