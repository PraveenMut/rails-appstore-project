Rails.application.routes.draw do
  root 'application#welcome'

    ## product routing
    get '/apps', to: 'apps#index', as: 'apps'
    post '/apps', to: 'apps#create'
    get '/apps/new', to: 'apps#new', as: 'new_app'
    get '/apps/:id', to: 'apps#show', as: 'app'
    get '/apps/:id/edit', to: 'apps#edit', as: 'edit_app'
    put '/apps/:id', to: 'apps#update'
    delete '/apps/:id', to: 'apps#delete'
    
    ## order routing
    get '/apps/:id/orders/new', to: 'orders#new', as: 'new_order'
    post '/apps/:id/orders', to: 'orders#create'
    get '/apps/:id/orders/:id', to: 'orders#show', as: 'order'

        ## devise routes  
    devise_for :users

    ## user profile and stores routing
    resources :users do
      resources :user_profiles
      resources :stores
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
