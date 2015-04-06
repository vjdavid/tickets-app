Rails.application.routes.draw do

	 resources :proyects do
		 resources :tickets
	 end
	
end
