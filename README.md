# README


## PreRequisites

1. Have a working PC (macbook highly preferred)
2. Have PostgreSQL installed and running
3. Have Ruby installed 
4. 

## Setup

1. Clone this repository
2. Install the ruby version (this might take a while, do this first) specified in `.ruby-version`
3. Run `bundle install` to install the packages specified in our Gemfile
4. Run `rails db:create db:migrate db:seed` to create the database, migrate the migrations and alas, seed the database with fake data
5. Run `rails s` to start the server
6. Use Insomnia to fiddle around with the development server through our GraphQL API


## Tools