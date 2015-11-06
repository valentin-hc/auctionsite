class LoginsController < ApplicationController
	def new
        # if session[:current_user_id]
        #     redirect_to users_path
        # else
       @user = User.new
        # end
	end

	def create
    	@user = User.find_by(email: params[:user][:email])
    	if @user && @user.authenticate(params[:user][:password])
    		session[:current_user_id] = @user.id
    		redirect_to user_path(@user)
        else 
            redirect_to root_path
        end
    end
    def destroy
    	session.destroy
        redirect_to users_path
    end
end
