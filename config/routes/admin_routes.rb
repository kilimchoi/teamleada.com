TeamLeada::Application.routes.draw do
  # Admin
  namespace :admin, path: "a" do
    match '/', to: redirect('/a/dashboard'), via: :get
    match 'dashboard', to: 'pages#dashboard', via: :get

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
      member do
        match 'projects/:project_id/publish-feedback', to: 'users#publish_feedback',
                                                       as: :publish_feedback,
                                                       via: :get
        match 'projects/:project_id/grant-access',     to: 'users#grant_access',
                                                       as: :grant_access,
                                                       via: :get
        match 'projects/:project_id/deny-access',      to: 'users#deny_access',
                                                       as: :deny_access,
                                                       via: :get

        match 'projects/:project_id/code-submissions', to: 'users#show_code_submissions',
                                                       as: :code_submissions,
                                                       via: :get
        match 'projects/:project_id/code-submissions/:code_submission_id', to: 'users#show_code_submission',
                                                                           as: :code_submission,
                                                                           via: :get
        match 'projects/:project_id/code-submissions/:code_submission_id/evaluate', to: 'code_submissions#evaluate',
                                                                                    as: :evaluate,
                                                                                    via: :post
        match 'projects/:project_id/code-submissions/:code_submission_id/evaluate', to: 'code_submissions#update_evaluation',
                                                                                    as: :update_evaluation,
                                                                                    via: :patch
        match 'projects/:project_id/code-submissions/:code_submission_id/evaluations', to: 'code_submission_evaluations#index',
                                                                                       as: :evaluations,
                                                                                       via: :get
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

    resources :code_submissions, path: "code-submissions", only: [:index] do
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

end

