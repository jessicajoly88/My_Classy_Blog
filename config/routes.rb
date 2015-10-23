Rails.application.routes.draw do
  get 'static_pages/about'
  root :to => 'posts#index'

  resources :posts do 
  	resources :tags
  	 resources :comments
  end
  
    resources :tags do
  	  resources :posts
  	end
end
