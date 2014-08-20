class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

TeamLeada::Application.routes.draw do
  root to: 'pages#home'

  match 'about', to: 'pages#about', via: :get
  #match 'tutoring', to: 'pages#tutoring', via: :get
  #match 'tutoring/purchase', to: 'pages#tutoring_purchase', as: 'tutoring_purchase', via: :post

  match 'invite', to: 'invites#index', as: 'invites', via: :get
  match 'invite', to: 'invites#create', as: 'invite_user', via: :post

  match 'learn', to: 'pages#student', as: :learn, via: :get
  match 'learn', to: 'users#auth_code', as: :auth_code, via: :post
  match 'ask-peter', to: 'pages#question_answer', as: 'question_answer', via: :get
  match 'ask-peter/guidelines', to: 'pages#question_guidelines', as: 'question_guidelines', via: :get

  match 'handbook', to: 'pages#handbook', as: :handbook, via: :get

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_up: 'sign-up', sign_out: 'logout'},
                     controllers: {
                       registrations: 'registrations',
                       sessions: 'sessions',
                       confirmations: 'confirmations',
                       passwords: 'passwords',
                       omniauth_callbacks: 'omniauth_callbacks'
                     }

  devise_scope :user do
    match 'confirm', to: "confirmations#confirm", as: :confirm, via: :patch
    match 'linkedin-confirm', to: "confirmations#linkedin_confirm", as: :linkedin_confirm, via: :patch
    match 'linkedin-confirm', to: "confirmations#show_linkedin_confirm", as: :show_linkedin_confirm, via: :get
  end

  match "profile", to: "users#profile", as: "show_user_profile", via: :get
  match "profile/edit", to: "users#edit_profile", as: "edit_user_profile", via: :get
  match 'settings', to: 'users#edit', as: 'edit_user', via: :get

  # Debug Bar
  match 'change-role', to: "users#change_role", as: :user_change_role, via: :get
  resources :users, only: [:show, :update] do
    member do
      match 'projects', to: 'users#projects', as: :projects, via: :get
      match 'projects/:project_id', to: 'users#project', as: :project, via: :get
      match 'projects/:project_id/feedback', to: 'users#project_feedback', as: :project_feedback, via: :get
    end
  end

  # Messages
  match 'messages', to: 'messages#create', as: 'messages', via: :post
  match 'conversations', to: 'conversations#create', as: 'create_conversation', via: :post
  resources :conversations, path: :messages, only: [:show, :index, :new] do
    get :autocomplete_user_name, on: :collection
  end

  resources :interested_users, only: [:create]

  resources :questions, path: 'ask-peter', only: [:show, :index, :new, :create] do
    member do
      match 'up-vote', to: 'questions#up_vote', as: 'up_vote', via: :post
    end
  end

  match 'employer', to: 'employer_applications#new', as: 'new_employer', via: :get
  resources :employer_applications, path: 'employer', as: 'employer', only: [:create]
  resources :companies, only: [:show]

  draw :project_routes
  draw :company_routes
  draw :admin_routes

  # 404 page routes
  match '*path', to: 'pages#error', via: :get
end

