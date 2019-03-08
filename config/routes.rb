Rails.application.routes.draw do
  
  #get 'tops/index'

  root 'tops#index'
  
  
  
  resources :inquiries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :blogs do
    
    collection do
      post :confirm
    end
    
  end
  
  
  
end
