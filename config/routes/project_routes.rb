TeamLeada::Application.routes.draw do

  match 'projects/how-this-works', to: 'pages#how_this_works', as: :project_faq, via: :get
  resources :projects, only: [:show, :index] do
    member do
      match 'info', to: "projects#project_info", as: "info", via: :get
      match 'submit', to: 'projects#check_submission', as: 'submission', via: :post
      match "project-submission", to: "users#submit_project_submission", as: "submit_project_submission", via: :post
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

  match 'quizzes/check_answer', to: 'quizzes#check_answer', via: :post

end
