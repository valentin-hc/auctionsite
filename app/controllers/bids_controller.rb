class BidsController < ApplicationController
	def create
		current_user = User.find_by_id(session[:current_user_id])
		product = Product.find_by(id: params[:product_id])
		#if Bid.(params[:bid][:amount])
		bid = product.bids.new(amount: params[:bid][:amount], user_id: current_user.id)
		#binding.pry
		if bid.save
			redirect_to users_path
		end
	end
end
