Rails.application.routes.draw do
  root 'users#index'
  resources :users do
    member do
      get 'question'
      get 'result'
    end
  end

  get '/update_question' => 'users#update_question'
  get '/auth/:provider/callback' => 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
