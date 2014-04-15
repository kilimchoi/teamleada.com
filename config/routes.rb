TeamLeada::Application.routes.draw do
  root to: "pages#home"

  match "about", to: "pages#about", via: :get

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: {
                       registrations: 'registrations',
                       sessions: 'sessions'
                     }

  resources :users, param: :username, only: [:show]

  resources :projects, param: :url, only: [:show, :index] do
    match "submit", to: "projects#check_submission", as: "submission", via: :post
    match "interest", to: "projects#show_interest", as: "interest", via: :post

    resources :lessons, param: :url, only: [:show] do
      resources :steps, param: :url, only: [:show]
    end
  end

  # Blog routes
  match "blog", to: "blog#home", via: :get
  match "blog/*path", to: "blog#load_blog_post", via: :get
  match "css/*path", to: "blog#load_stylesheets", via: :get

  # 404 page routes
  match "*path", to: "pages#error", via: :get
end
