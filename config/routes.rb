Rails.application.routes.draw do

  get ':slug' => 'links#show', as: 'slug_redirect'

  resources :links, except: [:edit, :update, :delete, :new]
  
  root 'home#index'

  

end
