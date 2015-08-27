Rails.application.routes.draw do

  resources :links, except: [:edit, :update, :delete, :new]

  get ':slug' => 'links#show', as: 'slug_redirect'
  
  root 'home#index'

  

end
