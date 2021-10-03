Rails.application.routes.draw do
  namespace :rest_api do
    resources :quotes do
      resources :quote_ratings
    end
    resources :random_quotes
  end
end
