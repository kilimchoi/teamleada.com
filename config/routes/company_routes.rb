TeamLeada::Application.routes.draw do
  # Company / Recruitment
  namespace :company, path: "r" do
    match '/', to: redirect('/r/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, path: "browse", only: [:index, :show] do
      member do
        match 'favorite', to: 'users#favorite', as: :favorite, via: :post
        match 'projects/:project_id', to: 'users#show_project', as: :project, via: :get
      end
    end
  end

end
