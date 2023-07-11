Rails.application.routes.draw do

  resources :movies, only: [:index, :show]
  resources :seasons, only: [:index, :show] do
    resources :episodes, only: [:index, :show]
  end
  
end
