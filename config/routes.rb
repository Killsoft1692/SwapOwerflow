Rails.application.routes.draw do
  resources :questions
  resources :likes, only: [:index, :create]
  devise_for :users, controllers: {registrations: "registrations"}

  post 'answers' => 'questions#create_answer'
  get 'hot_questions' => 'questions#rated'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
end
