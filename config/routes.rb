Rails.application.routes.draw do
  namespace :graphql_api do
    if Rails.env.development?
      mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
    end

    post "/graphql", to: "graphql#execute"
  end

  namespace :rest_api do
    resources :quotes do
      resources :quote_ratings
    end
    resources :random_quotes
  end
end
