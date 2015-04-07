Rails.application.routes.draw do

	 resources :proyects, defaults: {format: :json} do
		 resources :tickets
	 end
	
end
