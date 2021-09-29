Rails.application.routes.draw do
  resources :quotes do
    resources :quote_ratings
  end
  resources :random_quotes
end
