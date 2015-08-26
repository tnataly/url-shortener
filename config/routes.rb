Rails.application.routes.draw do
  resources :links, except: [:edit, :update, :delete, :new]
  
  root 'home#index'

  get ':slug' => 'links#show'
  
end
