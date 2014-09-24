TeamLeada::Application.routes.draw do

  resources :users, path: "", only: [:show, :update] do
    member do
      match "edit", to: "users#edit_profile", as: "edit_user_profile", via: :get

      match "edit/cancel", to: "user_profiles#cancel_update", as: "cancel_update_user_profile", via: :post
      match "edit/about", to: "user_profiles#update_about", as: "update_about_user_profile", via: :post
      match "edit/job_experience", to: "user_profiles#update_job_experience", as: "update_job_experience_user_profile", via: :post
      match "edit/job_experience", to: "user_profiles#remove_job_experience", as: "remove_job_experience_user_profile", via: :delete
      match "edit/enrollment", to: "user_profiles#update_enrollment", as: "update_enrollment_user_profile", via: :post

      match "settings", to: "users#edit", as: "edit_user", via: :get
    end

    scope module: :users do
      resources :stories, path: "posts", only: [:show, :index]
      resources :projects, only: [:show, :index] do
        member do
          match "feedback", to: "projects#feedback", as: :feedback, via: :get
        end

        collection do
          match "filter", to: "projects#filter", as: :filter, via: :get
        end

        scope module: :projects do
          resources :image_submission_contents, only: [:create]
          resources :submission_contexts, path: "submissions", only: [:show, :index] do
            member do
            end
          end
        end
      end
    end

  end

end
