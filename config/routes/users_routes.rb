TeamLeada::Application.routes.draw do

  resources :users, only: [:show, :update] do

    scope module: :users do
      resources :projects, only: [:show, :index] do
        member do
          match "feedback", to: "projects#feedback", as: :feedback, via: :get
        end

        collection do
          match "filter", to: "projects#filter", as: :filter, via: :get
        end

        scope module: :projects do
          resources :submission_contexts, path: "submissions", only: [:show, :index] do
            member do

            end
          end
        end
      end
      resources :stories, path: "posts", only: [:show, :index]
    end

  end

end
