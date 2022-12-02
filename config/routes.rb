Rails.application.routes.draw do
  root 'static_pages#top'

  get '/terms', to: 'static_pages#terms'
  get '/privacy', to: 'static_pages#privacy'
  
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete 'logout', to: "user_sessions#destroy"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :users, only: %i[new create]
  resources :profiles, only: %i[show edit update]
  resources :trekking_records, only: %i[index show edit update destroy]
  resources :mountains do
    resources :courses
  end
  resources :password_resets, only: %i[new create edit update]

  resources :calculate_energys, only: %i[create] do
    collection do
      get "prefectures/:prefecture_id/mountains", to: "calculate_energys#mountains", as: "mountains"
      get 'get_courses'
      post 'set_user'
      patch 'set_other', to: "calculate_energys#set_other"
      post 'set_other', to: "calculate_energys#set_other"
      post 'save_memo'
    end
  end
  resources :prefectures, only: %i[index]
  
  resources :memos do
    resources :portable_foods
    resources :portable_drinks
    collection do
      get "get_mountain"
      get "get_courses"
    end
    member do
      get "done", to: "memos#done"
    end
  end

  namespace :admin do
    root to: "dashbords#index"
    get 'login', to: "user_sessions#new"
    post 'login', to: "user_sessions#create"
    delete 'logout', to: "user_sessions#destroy"
    resources :prefecture, only: %i[index new create edit update destroy]
    resources :ration, only: %i[index new create edit update destroy]
    resources :drinks, only: %i[index new create edit update destroy]
  end
end
