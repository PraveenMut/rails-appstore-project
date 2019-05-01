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

    ## store routing
    get '/users/:id/stores/:id', to: 'stores#show', as: 'store'
    get '/users/:id/stores/new', to: 'stores#new', as: 'new_store'
    post '/users/:id/stores', to: 'stores#create'

    ## user profile routing
    get '/users/:id/user_profile/:id', to: 'user_profiles#show', as: 'user_profile'
    get '/users/:id/user_profile/new', to: 'user_profiles#new', as: 'new_user_profile'
    post '/users/:id/user_profile', to: 'user_profiles#create'
    get '/users/:id/user_profile/:id/edit', to: 'user_profiles#edit', as: 'edit_user_profile'
    put '/users/:id/user_profile/:id', to: 'user_profile#update'

    ## devise routes  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
