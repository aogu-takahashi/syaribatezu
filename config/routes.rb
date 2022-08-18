Rails.application.routes.draw do
  root 'static_pages#top'
  
  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
