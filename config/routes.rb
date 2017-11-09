Rails.application.routes.draw do
  resources :questions, only: [:index, :create, :create_answer]
  resources :likes, only: [:index, :create]
  devise_for :users, controllers: {registrations: "registrations"}

  post 'answers' => 'questions#create_answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
end
