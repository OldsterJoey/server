Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    # User Routes
    scope '/auth' do
      post '/sign_up', to: 'users#create'
      post '/sign_in', to: 'users#sign_in'

    end
    # Admin Profile Routes
    get '/admin_profiles', to: 'admin_profiles#index'
    post '/admin_profiles', to: 'admin_profiles#create'
    get '/admin_profiles/:id', to: 'admin_profiles#show'
    put '/admin_profiles/:id', to: 'admin_profiles#update'
    delete '/admin_profiles/:id', to: 'admin_profiles#destroy'
    # Child Profile Routes
    get '/child_profiles', to: 'child_profiles#index'
    post '/child_profiles', to: 'child_profiles#create'
    get '/child_profiles/:id', to: 'child_profiles#show'
    put '/child_profiles/:id', to: 'child_profiles#update'
    delete '/child_profiles/:id', to: 'child_profiles#destroy'
    # Question Routes
    get '/questions', to: 'questions#index'
    post '/questions', to: 'questions#create'
    get '/questions/:id', to: 'questions#show'
    put '/questions/:id', to: 'questions#update'
    delete '/questions/:id', to: 'questions#destroy'
    get '/questions/random', to: 'questions#random'
    # Wish List Routes
    get '/wish_lists', to: 'wish_lists#index'
    post '/wish_lists', to: 'wish_lists#create'
    get '/wish_lists/:id', to: 'wish_lists#show'
    put '/wish_lists/:id', to: 'wish_lists#update'
    delete '/wish_lists/:id', to: 'wish_lists#destroy'
    # Wishes Routes
    get '/wishes', to: 'wishes#index'
    post '/wishes', to: 'wishes#create'
    get '/wishes/:id', to: 'wishes#show'
    put '/wishes/:id', to: 'wishes#update'
    delete '/wishes/:id', to: 'wishes#destroy'
  end
end
 