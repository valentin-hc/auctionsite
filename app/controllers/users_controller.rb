class UsersController < ApplicationController
	skip_before_filter :require_login, :only => :create
	def index
		@user = current_user
		#binding.pry
	end
	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			flash["notice"] = "New account created !"
			redirect_to root_path
		else
			flash["errors"] = user.errors.full_messages
			redirect_to root_path
		end
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
