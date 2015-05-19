Rails.application.routes.draw do
  resources :applications
  devise_for :users

  get 'about' => 'welcome#about'
  get 'welcome/index'
  
  root to: 'welcome#index'
end
