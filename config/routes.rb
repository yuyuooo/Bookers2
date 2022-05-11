Rails.application.routes.draw do

 root to: "homes#top"
 resources :books
 devise_for :users
 devise_scope :user do
  post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
 end
 get "home/about" => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :users, only:[:show, :edit, :update, :index]
end
