Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/questions', to: 'questions#index'
    post '/questions', to: 'questions#create'
    get '/questions/:id', to: 'questions#show'
    put '/questions/:id', to: 'questions#update'
    delete '/questions/:id', to: 'questions#destroy'
    get '/questions/random', to: 'questions#random'
  end
end
 