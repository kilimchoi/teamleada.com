TeamLeada::Application.routes.draw do

  resources :interview_questions, path: "interview-questions", only: [:index, :show] do

  end

end
