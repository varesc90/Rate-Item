class VotesController < ApplicationController
	def create
		@vote = current_user.votes.create(params[:vote].permit(:user_id,:comment,:result,:product_id))
		@product = @vote.product
	end

end

