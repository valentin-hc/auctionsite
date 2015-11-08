Rails.application.routes.draw do
	root to: "logins#new"
	resources :users, only: [:index, :create, :destroy, :new] do
	    resources :products, only: [:index, :create, :new, :destroy]
  	end
  	resources :products, only: [:show] do 
  		resources :bids, only: [:create]
  	end
  	resources :logins, only: [:new, :create]
  	delete "/logins/delete" => "logins#destroy", as: :destroy_session
end
