Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'homes#top'
  root 'post_images#index'
  get "/home/about" => "homes#about"

 # ログアウト用に書いた
  devise_scope :user do
  	get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :homes
  resources :users
  resources :books

end
