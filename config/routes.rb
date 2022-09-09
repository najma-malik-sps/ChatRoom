Rails.application.routes.draw do
  devise_for :users do
    get 'logout' => 'devise/sessions#destroy'
  end
  resources :rooms do
    resources :messages
    post "/join" => "rooms#join_room"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rooms#index"
end
