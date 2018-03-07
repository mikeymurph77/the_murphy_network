Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/faq', to: 'welcome#faq'

  post '/welcome/check', to: 'welcome#check'

  resources :contacts
  resources :ideas do
    collection do
      post '/vote', to: 'ideas#vote'
    end
  end
end
