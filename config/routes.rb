Rails.application.routes.draw do
  resources :surveys do
    resources :questions
  end
end
