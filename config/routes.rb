Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'names', to: 'users/registrations#new_name'
    post 'names', to: 'users/registrations#create_name'
  end
  root to: "bookreviews#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
