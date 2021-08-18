# Wishfully Server

Deployed Server: https://wishfully-server.herokuapp.com/

Set Up: In order to have full access to the servers files, you must create a new master key. To do this, run this command in terminal within the servers directory:

EDITOR='code --wait' rails credentials:edit

If you do not use VS Code as your code editor, you must replace the section marked "code" with the appropriate command for the code editor you're using.

You must also ensure all gems within the source code are installed by using the "bundle install" command within the servers directory.

Admin Profile Routes
    
get '/admin_profiles', to: 'admin_profiles#index'
post '/admin_profiles', to: 'admin_profiles#create'
get '/admin_profiles/:id', to: 'admin_profiles#show'
put '/admin_profiles/:id', to: 'admin_profiles#update'
delete '/admin_profiles/:id', to: 'admin_profiles#destroy'

Child Profile Routes

get '/child_profiles', to: 'child_profiles#index'
post '/child_profiles', to: 'child_profiles#create'
get '/child_profiles/:id', to: 'child_profiles#show'
put '/child_profiles/:id', to: 'child_profiles#update'
delete '/child_profiles/:id', to: 'child_profiles#destroy'

Question Routes

get '/questions', to: 'questions#index'
post '/questions', to: 'questions#create'
get '/questions/:id', to: 'questions#show'
put '/questions/:id', to: 'questions#update'
delete '/questions/:id', to: 'questions#destroy'
get '/questions/random', to: 'questions#random'

Wish List Routes

get '/wish_lists', to: 'wish_lists#index'
post '/wish_lists', to: 'wish_lists#create'
get '/wish_lists/:id', to: 'wish_lists#show'
put '/wish_lists/:id', to: 'wish_lists#update'
delete '/wish_lists/:id', to: 'wish_lists#destroy'

Wishes Routes

get '/wishes', to: 'wishes#index'
post '/wishes', to: 'wishes#create'
get '/wishes/:id', to: 'wishes#show'
put '/wishes/:id', to: 'wishes#update'
delete '/wishes/:id', to: 'wishes#destroy'

How to run the test suite: Run the command: rspec
