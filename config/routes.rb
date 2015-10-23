Rails.application.routes.draw do
  root :to => 'posts#index'

  get 'static_pages/about'

  resources :posts do 
  	resources :tags
  	 resources :comments
  end
  
    resources :tags do
  	  resources :posts
  	end
end
