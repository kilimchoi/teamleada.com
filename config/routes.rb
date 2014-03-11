TeachData::Application.routes.draw do
  root to: "pages#home"

  match "about", to: "pages#about", via: :get
  match "handbook", to: "pages#handbook", via: :get
end
