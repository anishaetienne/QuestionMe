Rails.application.routes.draw do
  
  resources :questions

  get 'about' => 'questionme#about'

  
  root to: 'questionme#index'
end
