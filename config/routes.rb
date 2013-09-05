Dictionary::Application.routes.draw do

  root to:  "home#welcome"

  devise_for :users
  
  resources :projects

end
