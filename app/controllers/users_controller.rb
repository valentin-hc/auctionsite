class UsersController < ApplicationController
	def index
		@users = User.all
		#binding.pry
	end
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			redirect_to users_path
		else
			redirect_to new_user_path
		end
	end

	def show
		@user = User.find_by(id: params[:id])
	end
	def destroy
		user = User.find_by(id: params[:id])
		user.destroy
		redirect_to users_path 
	end






	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
