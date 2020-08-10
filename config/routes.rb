 Rails.application.routes.draw do
  devise_for :users
  root :to  => "users#home"
  get "home/about" => "users#home2"
  resources :users
  get "follower/users/:id" => "users#follower_users",as:"follower_users"
  get "follow/users/:id" => "users#follow_users",as:"follow_users"

  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
 end
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
end
