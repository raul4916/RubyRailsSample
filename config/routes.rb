Rails.application.routes.draw do
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# 
	get '/cards/validate/:title', to: 'cards#validate'
	
end
