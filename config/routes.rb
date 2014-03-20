TeamLeada::Application.routes.draw do
  root to: "pages#home"

  match "about", to: "pages#about", via: :get
  match "handbook", to: "pages#handbook", via: :get
  match "test", to: "pages#test", via: :get

  resources :projects, param: :url, only: [:show] do
    resources :lessons, param: :url, only: [:show] do
      resources :steps, param: :url, only: [:show]
    end
  end
end
