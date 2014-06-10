TeamLeada::Application.routes.draw do
  root to: 'pages#home'

  match 'about', to: 'pages#about', via: :get
  match 'tutoring', to: 'pages#tutoring', via: :get
  match 'tutoring/purchase', to: 'pages#tutoring_purchase', as: 'tutoring_purchase', via: :post

  match 'learn', to: 'pages#student', as: :learn, via: :get
  match 'learn', to: 'users#auth_code', as: :auth_code, via: :post
  match 'ask-peter', to: 'pages#question_answer', as: 'question_answer', via: :get
  match 'ask-peter/guidelines', to: 'pages#question_guidelines', as: 'question_guidelines', via: :get

  match 'surveys/:name', to: 'surveys#show', via: :get

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: {
                       registrations: 'registrations',
                       sessions: 'sessions',
                       confirmations: 'confirmations',
                       passwords: 'passwords'
                     }

  devise_scope :user do
    match 'confirm', to: "confirmations#confirm", as: :confirm, via: :patch
  end

  match 'settings', to: 'users#edit', as: 'edit_user', via: :get
  resources :users, only: [:show, :update]
  resources :interested_users, only: [:create]

  resources :questions, path: 'ask-peter', only: [:show, :index, :new, :create] do
    member do
      match 'up-vote', to: 'questions#up_vote', as: 'up_vote', via: :post
    end
  end

  match 'employer', to: 'employer_applications#new', as: 'new_employer', via: :get
  resources :employer_applications, path: 'employer', as: 'employer', only: [:create]

  resources :projects, only: [:show, :index] do
    member do
      match 'submit', to: 'projects#check_submission', as: 'submission', via: :post
      match 'interest', to: 'projects#show_interest', as: 'interest', via: :post
      match 'purchase', to: 'charges#create', as: 'purchase', via: [:post]
      match 'complete', to: 'projects#complete', as: 'complete', via: :post
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

  resources :companies, only: [:show]

  namespace :admin do
    match '/', to: redirect('/admin/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, only: [:index, :show]
    resources :resumes, only: [:index, :show]
    resources :companies do
      member do
        match 'add-project', to: 'companies#add_project', as: :add_project, via: :post
        match 'add-user', to: 'companies#add_user', as: :add_user, via: :post
      end
    end
    resources :projects, only: [:index, :show]
    resources :codes do
      member do
        match '/', to: 'codes#update', as: :update, via: :put
      end
    end
    resources :employer_applications, path: "employer-applications", only: [:index, :show]
    resources :questions, only: [:index, :show] do
      member do
        match 'hide', to: 'questions#hide', as: :hide, via: :post
      end
    end
  end

  # 404 page routes
  match '*path', to: 'pages#error', via: :get
end
