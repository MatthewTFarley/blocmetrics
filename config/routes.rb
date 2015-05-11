Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  devise_for :users
  get 'about' => 'welcome#about'
  get 'welcome/index'
  root to: 'welcome#index'
end
