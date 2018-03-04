Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  post '/welcome/check', to: 'welcome#check'

  resources :contacts
end
