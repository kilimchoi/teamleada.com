TeamLeada::Application.routes.draw do

  resources :users, path: "u", only: [:show, :update] do

    scope module: :users do
      resources :projects, only: [:show, :index] do
        member do
          match "feedback", to: "projects#feedback", as: :feedback, via: :get
        end
      end
      resources :stories, path: "posts", only: [:show]
    end

  end

end
