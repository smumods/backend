Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :users
  
  # ActiveAdmin route
  ActiveAdmin.routes(self)
  
  # Admin Routes
  constraints subdomain: 'admin' do
    # Pages
    root to: "pages#home"
    site_pages = ['about']
    for page in site_pages
      get "#{page}", to: "pages##{page}", as: page
    end
    
    # Devise for ClubAdmin
    devise_for :club_admins, path: '/'
    
    # Clubs
    get 'dashboard', to: 'clubs#index'
    resources :clubs, only: [:show, :edit, :update]

    # Club Managers
    resources :club_managers, only: [:create, :destroy]

    # Club Members
    resources :club_memberships, only: [:create, :destroy]
  end

  # GraphQL
  post "/graphql", to: "graphql#execute"
  # GraphiQL for Development
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
