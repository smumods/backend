Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # devise_for :users
  
  
  # Admin Routes
  append_staging = ""
  if Rails.env.staging?
    append_staging = "-staging"
  end
  constraints subdomain: "admin#{append_staging}" do
    # Pages
    authenticated :club_admin do
      root to: 'clubs#index'
    end
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
    
    # Events
    resources :events
  end
  
  # Quick hack to get subdomains working
  # Staging API
  constraints subdomain: 'api-staging' do
    # ActiveActive
    ActiveAdmin.routes(self)

    # GraphQL
    post "/graphql", to: "graphql#execute"
  end

  # Normal API
  constraints subdomain: 'api' do
    # ActiveActive
    ActiveAdmin.routes(self)

    # GraphQL
    post "/graphql", to: "graphql#execute"
  end
  
  # GraphQL for Development
  if Rails.env.development?
    post "/graphql", to: "graphql#execute"
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
