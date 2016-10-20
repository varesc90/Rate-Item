class UsersController < ApplicationController
	 layout 'main'
  	 layout 'application', except: :view

  	 def show
  	 	find_user
  	 	@products = @user.products.all.sort_by(&:created_at).reverse
  	 	@votes = @user.votes.all.sort_by(&:created_at).reverse
  	 end

  	 def find_user
  	 	@user = User.find(params[:id])
  	 end
end
