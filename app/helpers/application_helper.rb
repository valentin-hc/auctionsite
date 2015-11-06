module ApplicationHelper

	def current_user
		return unless session[:current_user_id]
		@current_user ||= User.find(session[:current_user_id])
  	end

	def display_current_user
		if current_user.present?
			content_tag :p do
				"Logged in as : #{current_user.name}" 
			end
		end
	end
	def display_logout
		if current_user.present?
			button_to "Delete session", destroy_session_path, :method => :delete
		end
	end

end
