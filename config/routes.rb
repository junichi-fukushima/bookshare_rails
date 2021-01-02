Rails.application.routes.draw do
  get 'accounts/show'
  root to: 'bookreviews#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'names', to: 'users/registrations#new_name'
    post 'names', to: 'users/registrations#create_name'
  end

  resource :account, only: [:show]

  resources :bookreviews do
    # 【likesのidを使わない場合はresourceにする、詳細ページはいらないので】
    resource :likes, only: %i[create destroy]
    collection do
      get 'search'
    end
  end
end
