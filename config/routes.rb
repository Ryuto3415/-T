Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about", to: "homes#about",as: "about"
  resources :trains, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :train_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end
  resources :chats, only: [:show, :create, :destroy]
  get "search" => "searches#search"
end
