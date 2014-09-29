TeamLeada::Application.routes.draw do

  resources :interview_questions, path: "interview-questions", only: [:index, :show] do
    member do
      match "submit", to: "interview_questions#submit", via: :post
    end
  end

end
