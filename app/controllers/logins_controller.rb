class LoginsController < ApplicationController
	skip_before_filter :require_login
    def new
       @user = User.new
       @products = Product.all
	end

	def create
    	@user = User.find_by(email: params[:user][:email])
    	if @user && @user.authenticate(params[:user][:password])
    		session[:current_user_id] = @user.id
            flash["notice"] = "Logged in successfully"
    		redirect_to users_path
        else 
            flash["login_error"] = "Loggin failed, wrong login or password"
            redirect_to root_path
        end
    end
    def destroy
    	session.destroy
        redirect_to root_path
    end
end
