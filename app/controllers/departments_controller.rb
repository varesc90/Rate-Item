class DepartmentsController < ApplicationController

	def index
		@departments = Department.all

		respond_to do |format|
			format.html
    		format.json { render json: @departments }
		end	
	end

	def show
		find_department
		@subdepartments = @department.subdepartments
		@products = []


	end

	def new
		@department = Department.new
	end

	def edit
		find_department
		@department.subdepartments.build
	end

	def create
		@department = Department.create(params[:department].permit(:departmentname))
		
		if @department.valid?
			redirect_to(@department,notice: 'New department has been created')
		end
	end

	def update
		find_department
		@department.update(params[:department].permit(:departmentname,subdepartments_attributes:[:subdepartmentname,:id]))
		redirect_to(departments_path,notice: 'Your department has been saved')
	end

	def find_department
		@department = Department.find(params[:id])
	end
end
