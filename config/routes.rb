Rails.application.routes.draw do
  post '/login', to: 'auth#login'  
end
