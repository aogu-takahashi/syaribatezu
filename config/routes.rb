Rails.application.routes.draw do
  root 'static_pages#top'
  
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete 'logout', to: "user_sessions#destroy"

  resources :users, only: %i[new create]
  resources :mountains do
    resources :courses
  end
  
  resources :memos do
    resources :portable_foods
    resources :portable_drinks
    collection do
      get 'get_mountain'
      get 'get_courses' 
    end
  end
end
