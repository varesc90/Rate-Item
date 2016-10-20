class SubdepartmentsController < ApplicationController
	def new
		@departments = Department.all
		@subdepartment = Subdepartment.new
	end

	def create
		Subdepartment.create(params[:subdepartment].permit(:subdepartmentname,:department_id))
		redirect_to(departments_path,notice: "New sub-department has been created")
	end

	def destroy
		find_subdepartment
		if @subdepartment.products.exists?
			redirect_to(departments_path,notice: "You have to delete all products in this sub-department before you can delete sub-department")
		else
			@subdepartment.destroy
			redirect_to(departments_path,notice: "Your sub-department has been deleted")
		end
	end

	def show
		find_subdepartment
		@products = @subdepartment.products
	end

	def find_subdepartment
		@subdepartment = Subdepartment.find(params[:id])
	end
end
