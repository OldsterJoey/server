Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
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
  end
end
 