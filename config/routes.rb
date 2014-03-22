TeamLeada::Application.routes.draw do
  root to: "pages#home"

  match "about", to: "pages#about", via: :get

  devise_for :users

  resources :projects, param: :url, only: [:show, :index] do
    resources :lessons, param: :url, only: [:show] do
      resources :steps, param: :url, only: [:show]
    end
  end
end
