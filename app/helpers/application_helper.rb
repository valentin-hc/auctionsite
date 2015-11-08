module ApplicationHelper
	def flash_message
		if flash["notice"].present?
			content_tag :p do 
				flash["notice"]
			end
		elsif flash["errors"].present?
			content_tag :ul do
				flash["errors"].map do |error_message|
					concat(content_tag(:li, error_message))
				end
			end
		end
	end

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
			button_to "Logout", destroy_session_path, :method => :delete
		end
	end

end
