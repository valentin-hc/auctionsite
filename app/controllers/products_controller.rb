class ProductsController < ApplicationController
	def index
		@user = User.find_by(id: params[:user_id])
		@products = @user.products.all
	end
	def new
		@user = User.find_by(id: params[:user_id])
		@product = Product.new
	end
	def create
		user = User.find_by(id: params[:user_id])
		product = user.products.new(product_params)
		if product.save
			redirect_to user_products_path(user)
		end
	end
	def destroy
		product = Product.find_by(id: params[:id])
		product.destroy
		user = product.user_id
		redirect_to user_products_path(user)
	end
	def show
	end



	private
	def product_params
		params.require(:product).permit(:title, :description, :date, :time)
	end
end
