TeamLeada::Application.routes.draw do
  resources :companies, only: [:index] do
    scope module: :companies do
      resources :users, path: "employees", only: [:index, :show] do
        member do
        end
      end

      resources :stories, path: "posts", only: [:show, :index]
    end
  end

  # Company / Recruitment
  namespace :company, path: "r" do
    match '/', to: redirect('/r/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, path: "browse", only: [:index, :show] do
      member do
        match 'favorite', to: 'users#favorite', as: :favorite, via: :post
        match 'unfavorite', to: 'users#unfavorite', as: :unfavorite, via: :post
        match 'projects/:project_id', to: 'users#show_project', as: :project, via: :get
      end
    end
  end

end
