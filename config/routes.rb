Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :users
  
  # ActiveAdmin route
  ActiveAdmin.routes(self)
  
  # Admin Routes
  constraints subdomain: 'admin' do
    resources :clubs
  end

  # GraphQL
  post "/graphql", to: "graphql#execute"
  # GraphiQL for Development
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
