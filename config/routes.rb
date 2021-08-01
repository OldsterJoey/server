Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    get '/adminquestions', to: 'adminquestions#index'
    post '/adminquestions', to: 'adminquestions#create'
    get '/adminquestions/:id', to: 'adminquesions#show'
    put '/adminquestions/:id', to: 'adminquesions#update'
    delete '/adminquestions/:id', to: 'adminquesions#destroy'
    get '/adminquestions/random', to: 'adminquestions#random'
  end
end
 