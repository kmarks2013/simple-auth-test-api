Rails.application.routes.draw do
  post '/login', to: 'auth#login'  
  post '/signup', to:  'users#create'
end
