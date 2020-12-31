Rails.application.routes.draw do
  root to: "bookreviews#index"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'names', to: 'users/registrations#new_name'
    post 'names', to: 'users/registrations#create_name'
  end
  
  resources :bookreviews do
    collection do
      get 'search'
    end
  end
end
