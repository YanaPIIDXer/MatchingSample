Rails.application.routes.draw do

  root 'top#index'
  
  get 'top' => 'top#index'
  
  get 'join' => 'users#new'
  resources :users, only: [:create]

  get 'login' => 'login#index'
  post 'login/check'

  get 'user_top' => 'user_top#index'

  get 'user_search' => 'user_search#index'
  get 'user_search_result' => 'user_search#result'

  get 'user_info' => 'user_info#index'
  get 'contact_request' => 'user_info#contact_request'
  get 'cancel_contact_request' => 'user_info#cancel_contact_request'

  get 'contact_requests' => 'contact_requests#index'
  get 'create_contact' => 'contact_requests#create_contact'
  
  get 'contact_list' => 'contact_list#index'

  get 'contact' => 'contact#index'
  post 'contact/send_message' => 'contact#send_message'

  get 'logout' => 'logout#logout'

  get 'error' => 'error#index'
end
