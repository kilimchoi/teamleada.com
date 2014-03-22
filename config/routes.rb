TeamLeada::Application.routes.draw do
  devise_for :users
  root to: "pages#home"

  match "about", to: "pages#about", via: :get

  resources :projects, param: :url, only: [:show, :index] do
    resources :lessons, param: :url, only: [:show] do
      resources :steps, param: :url, only: [:show]
    end
  end
end
