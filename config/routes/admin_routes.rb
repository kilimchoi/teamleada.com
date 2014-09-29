TeamLeada::Application.routes.draw do
  # Admin
  namespace :admin, path: "a" do
    match '/', to: redirect('/a/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get
    match "activity", to: "pages#activity", via: :get
    match "metrics", to: "pages#metrics", via: :get

    resources :features, only: [:index]

    match "page-views", to: "pages#page_views_dashboard", as: "impressions", via: :get
    scope "page-views" do
      match ":timeframe", to: "pages#page_views_timeframe",
                          as: :timeframe,
                          via: :get
      match ":timeframe/:category", to: "pages#page_views_category",
                                   as: :timeframe_category,
                                   via: :get
    end

    resources :users, only: [:index, :show] do
      scope module: :users do
        resources :projects, only: [:show, :index] do
          member do
            match "publish-feedback", to: "projects#publish_feedback", as: :publish_feedback, via: :get
            match "grant-access", to: "projects#grant_access", as: :grant_access, via: :get
            match "deny-access", to: "projects#deny_access", as: :deny_access, via: :get
          end

          scope module: :projects do
            resources :project_submissions, path: "submissions", only: [:show, :index] do
              member do
                match "evaluate", to: "project_submissions#evaluate", as: :evaluate, via: :post
                match "evaluate", to: "project_submissions#update_evaluation", as: :update_evaluations, via: :patch
              end

              scope module: :project_submissions do
                resources :submission_evaluations, path: "evaluations", only: [:index]
              end
            end
          end
        end
      end
    end

    match 'conversations', to: 'conversations#create', as: 'create_conversation', via: :post
    resources :conversations, path: :messages, only: [:show, :index, :new]

    resources :resumes, only: [:index, :show]
    resources :profile_photos, path: 'profile-photos', only: [:index]

    match 'company-dashboards', to: 'pages#company_dashboards', as: "company_dashboards", via: :get
    resources :companies do
      member do
        match 'add-project', to: 'companies#add_project', as: :add_project, via: :post
        match 'add-user', to: 'companies#add_user', as: :add_user, via: :post
      end
    end

    resources :universities, only: [:index]
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

    resources :project_submissions, path: "submissions", only: [:index]
    resources :interview_question_submissions, path: "interview-question-submissions", only: [:show, :index]

    match "charts/category/active-users",        to: "pages#active_users_charts",       as: :active_users_charts,       via: :get
    match 'charts/category/realtime',            to: "pages#realtime_charts",           as: :realtime_charts,           via: :get
    match 'charts/category/page-views',          to: "pages#page_view_charts",          as: :page_view_charts,          via: :get
    match 'charts/category/growth',              to: "pages#growth_charts",             as: :growth_charts,             via: :get
    match 'charts/category/project-submissions', to: "pages#project_submission_charts", as: :project_submission_charts, via: :get
    match 'charts/category/:category',           to: "charts#show_by_category",         as: :chart_category,            via: :get
    resources :charts, only: [:show]
  end

end

