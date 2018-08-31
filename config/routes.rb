Rails.application.routes.draw do

  #root to: "users#index"

  devise_scope :user do

    authenticated  do
      root to: "users#index"
    end


    unauthenticated do
      root to: "devise/sessions#new"
    end

  end

  #devise_for :users
  #resources :users

#  devise_scope :user do
#    authenticated :user do
#      root 'home#index', as: :authenticated_root
 #   end

 #   unauthenticated do
  #    root 'devise/sessions#new', as: :unauthenticated_root
  #  end
  #end


  devise_for :users
  resources :users
end
