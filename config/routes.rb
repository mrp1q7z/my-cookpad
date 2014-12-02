Rails.application.routes.draw do
  get 'kitchen/:id', to: 'kitchen#show', as: 'kitchen'

  resources :email_magazines
  resources :recipes, only: [:new, :create, :edit, :show, :update] do
    member do
      delete :delete_image
      patch :publish
    end
    get :search, on: :collection
    resources :directions, only: [:create, :update, :destroy] do
      member do
        patch :move_highter
        patch :move_lower
      end
    end
    resources :tukurepos, only: [:create]
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#index'
end
