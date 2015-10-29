Rails.application.routes.draw do
  
  devise_for :admins
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
