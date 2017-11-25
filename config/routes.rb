Rails.application.routes.draw do
  resources :users do
    member do
      get 'question'
    end
  end

  get '/update_question' => 'users#update_question'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
