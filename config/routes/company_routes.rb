TeamLeada::Application.routes.draw do
  resources :companies, only: [:index, :show] do
    member do
      # Mostly static pages
      match "perks", to: "companies#perks", via: :get
      match "benefits", to: "companies#benefits", via: :get

      # Follow/unfollow
      match "follow", to: "companies#follow", via: :post
      match "unfollow", to: "companies#unfollow", via: :post

      # General user actions
      match "data-challenges-interest", to: "companies#data_challenges_interest", via: :post
      match "interest", to: "companies#company_interest", via: :post
    end

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

    resources :users, path: "browse", as: :browse_users, only: [:index, :show] do
      member do
        match 'favorite', to: 'users#favorite', as: :favorite, via: :post
        match 'unfavorite', to: 'users#unfavorite', as: :unfavorite, via: :post
      end

      scope module: :users do
        resources :projects, only: [:show]
      end
    end
  end

end
