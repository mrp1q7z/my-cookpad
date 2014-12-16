Rails.application.routes.draw do
  resources :email_magazines

  resources :recipes, only: [:new, :create, :edit, :show, :update] do
    get :search, on: :collection
    member do
      delete :delete_image
      patch :publish
    end

    resources :directions, only: [:create, :update, :destroy] do
      member do
        delete :delete_image
        patch :move_highter
        patch :move_lower
      end
    end

    resources :tukurepos, only: [:create]
  end

  resources :kitchens, only: [:show]

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'
end
