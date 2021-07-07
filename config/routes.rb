Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings'
    get 'followers' => 'relationships#followers'
  end
  resources :books do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites,only: [:create,:destroy]
  end

end