TeamLeada::Application.routes.draw do
  root to: 'pages#home'

  match 'about', to: 'pages#about', via: :get
  match 'tutoring', to: 'pages#tutoring', via: :get
  match 'tutoring/purchase', to: 'pages#tutoring_purchase', as: 'tutoring_purchase', via: :post

  match 'invite', to: 'invites#index', as: 'invites#index', as: 'invites', via: :get
  match 'invite', to: 'invites#create', as: 'invites#create', as: 'invite_user', via: :post

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

  resources :users, only: [:show, :update] do
    member do
      match 'projects', to: 'users#projects', as: :projects, via: :get
      match 'projects/:project_id', to: 'users#project', as: :project, via: :get
      match 'projects/:project_id/feedback', to: 'users#project_feedback', as: :project_feedback, via: :get
    end
  end

  # Messages
  match 'messages', to: 'messages#create', as: 'messages', via: :post
  resources :conversations, path: :messages, only: [:show, :index] do
  end

  resources :interested_users, only: [:create]

  resources :questions, path: 'ask-peter', only: [:show, :index, :new, :create] do
    member do
      match 'up-vote', to: 'questions#up_vote', as: 'up_vote', via: :post
    end
  end

  match 'employer', to: 'employer_applications#new', as: 'new_employer', via: :get
  resources :employer_applications, path: 'employer', as: 'employer', only: [:create]

  match 'projects/how-this-works', to: 'pages#how_this_works', as: :project_faq, via: :get
  resources :projects, only: [:show, :index] do
    member do
      match 'submit', to: 'projects#check_submission', as: 'submission', via: :post
      match 'interest', to: 'projects#show_interest', as: 'interest', via: :post
      match 'purchase', to: 'charges#create', as: 'purchase', via: [:post]
      match 'complete', to: 'projects#complete', as: 'complete', via: :post
      match 'code-submission', to: 'projects#submit_code', as: 'code_submission', via: :post
      match 'resource-submit', to: 'projects#submit_resource', as: 'submit_resource', via: :post
      match 'resource', to: 'projects#resource', as: 'resource', via: :post
    end

    resources :lessons, only: [:show] do
      resources :steps, only: [:show]
    end
  end

  match 'quizzes/check_answer', to: 'quizzes#check_answer', via: :get

  resources :companies, only: [:show]

  # Company / Recruitment
  namespace :company, path: "r" do
    match '/', to: redirect('/r/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, path: "browse", only: [:index, :show] do
      member do
        match 'projects/:project_id', to: 'users#show_project', as: :project, via: :get
      end
    end
  end

  # Admin
  namespace :admin, path: "a" do
    match '/', to: redirect('/a/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

    resources :users, only: [:index, :show] do
      member do
        match 'projects/:project_id/publish-feedback', to: 'users#publish_feedback', as: :publish_feedback, via: :get
        match 'projects/:project_id/code-submissions', to: 'users#show_code_submissions', as: :code_submissions, via: :get
        match 'projects/:project_id/code-submissions/:code_submission_id', to: 'users#show_code_submission', as: :code_submission, via: :get
        match 'projects/:project_id/code-submissions/:code_submission_id/evaluate', to: 'code_submissions#evaluate', as: :evaluate, via: :post
        match 'projects/:project_id/code-submissions/:code_submission_id/evaluate', to: 'code_submissions#update_evaluation', as: :update_evaluation, via: :patch
      end
    end
    resources :resumes, only: [:index, :show]
    resources :profile_photos, path: 'profile-photos', only: [:index]

    match 'company-dashboards', to: 'pages#company_dashboards', as: "company_dashboards", via: :get
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

    resources :code_submissions, path: "code-submissions", only: [:index, :show] do
      member do
        match 'evaluate', to: 'code_submissions#evaluate', as: :evaluate, via: :post
        match 'evaluate', to: 'code_submissions#update_evaluation', as: :update_evaluation, via: :patch
      end
    end

    match 'charts/category/realtime', to: "pages#realtime_charts", as: :realtime_charts, via: :get
    match 'charts/category/page-views', to: "pages#page_view_charts", as: :page_view_charts, via: :get
    match 'charts/category/:category', to: "charts#show_by_category", as: :chart_category, via: :get
    resources :charts, only: [:show]
  end

  # 404 page routes
  match '*path', to: 'pages#error', via: :get
end
