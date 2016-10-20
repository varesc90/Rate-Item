class ProductsController < ApplicationController
	before_action :authenticate_user!, except: :show
	def new
		find_department(params[:id])
		@subdepartments = @department.subdepartments
		@product = Product.new
		@product.productinformation = Productinformation.new
	end

	def edit
		find_product
		find_department(@product.subdepartment.department_id)
		@subdepartments = @department.subdepartments
	end

	def update
		find_product
		@product.update(params_product)
		redirect_to(product_path, notice: 'Your product has been updated')
	end

	def create
		current_user.products.create(params_product)
		redirect_to(root_path, notice: 'Your product has been created')
	end

	def show
		find_product
		@vote = Vote.new
		@results = @product.votes
		if user_signed_in?
		@results_from_current_user = @results.where(user_id: current_user.id)
		end
	end
	def choosenew
		@departments = Department.all
	end

	def destroy
		find_product
		@product.destroy
		redirect_to(departments_path, notice: 'Your Item has been deleted')
	end

	def showvote
		find_product
		@votes = @product.votes
	end


###################################################################


	def find_department(department)
		@department = Department.find(department)
	end

	def find_product
		@product = Product.find(params[:id])
	end

	def params_product
		params[:product].permit(:product_name, :productdescription, :subdepartment_id, :user_id, :product_pic,
								productinformation_attributes:[:length,:width,:height,:productweight,:product_id])
	end

end
