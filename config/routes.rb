Rails.application.routes.draw do
  get 'admin/messaging_index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'static_pages#home'
  get 'messages' => 'messages#index'
  resources :users
  resources :messages
end
