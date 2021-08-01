Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/questions', to: 'questions#index'
    post '/questions', to: 'questions#create'
    get '/questions/:id', to: 'quesions#show'
    put '/questions/:id', to: 'quesions#update'
    delete '/questions/:id', to: 'quesions#destroy'
    get '/questions/random', to: 'questions#random'
  end
end
 