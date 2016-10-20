module ApplicationHelper
	def admin?
		if user_signed_in?
		current_user.admin?
		else
		false
		end
	end

	def render_productlist(products)
		render(partial: 'shared/productlist', collection: products, as: :product)
	end
end
