class HomeController < ApplicationController
	def main
		@top_products = sort_product_by(:number_of_positive_vote).reverse
		@trending_products = sort_product_by(:number_of_vote).reverse
	end

	def s 
		@products = Product.search(params[:query])
	end

	def sort_product_by(x)
		Product.all.sort_by(&x)
	end


end
