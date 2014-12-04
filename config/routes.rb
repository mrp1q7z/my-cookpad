Rails.application.routes.draw do
  resources :email_magazines

  resources :recipes, only: [:new, :create, :edit, :show, :update] do
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
    get :search, on: :collection
  end

  get 'kitchen/:id', to: 'kitchen#show', as: 'kitchen'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'
end
