Rails.application.routes.draw do

  root 'top#index'
  
  get 'top' => 'top#index'
  
  get 'join' => 'users#new'
  resources :users, only: [:create]

  get 'login' => 'login#index'
  post 'login/check'

  get 'user_top' => 'user_top#index'

  get 'user_search' => 'user_search#index'
  post 'user_search_query' => 'user_search#query'
  get 'user_search_result' => 'user_search#result'


  get 'logout' => 'logout#logout'

  get 'error' => 'error#index'
end
