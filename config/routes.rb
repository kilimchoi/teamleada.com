TeamLeada::Application.routes.draw do
  root to: 'pages#home'

  match 'about', to: 'pages#about', via: :get
  match 'tutoring', to: 'pages#tutoring', via: :get

  match 'student', to: 'pages#student', via: :get
  match 'student', to: 'users#auth_code', via: :post

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: {
                       registrations: 'registrations',
                       sessions: 'sessions'
                     }

  resources :users, only: [:show]
  resources :interested_users, only: [:create]

  match 'employer', to: 'employer_applications#new', as: 'new_employer', via: :get
  resources :employer_applications, path: 'employer', as: 'employer', only: [:create]

  resources :projects, only: [:show, :index] do
    member do
      match 'submit', to: 'projects#check_submission', as: 'submission', via: :post
      match 'interest', to: 'projects#show_interest', as: 'interest', via: :post
      match 'purchase', to: 'charges#create', as: 'purchase', via: [:post]
    end

    resources :lessons, only: [:show] do
      resources :steps, only: [:show]
    end
  end

  #resources :quizzes do
  #  collection do
  #    get :check_answer
  #  end
  #end

  match 'quizzes/check_answer', to: 'quizzes#check_answer', via: :get

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, only: [:index, :show]
    resources :companies do
      member do
        match 'add-project', to: 'companies#add_project', as: :add_project, via: :post
        match 'add-user', to: 'companies#add_user', as: :add_user, via: :post
      end
    end
    resources :projects, only: [:index, :show]
    resources :codes
  end

  # 404 page routes
  match '*path', to: 'pages#error', via: :get
end
