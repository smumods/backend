# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (User.all.length == 0)
    (0..10).each do |i|
        user = User.create(name: Faker::Name.unique.name, email: "#{i}@example.com")
        Book.create(title: Faker::Company.bs.titleize, user: user)
    end
end

if (Link.all.length == 0)
    Link.create url: 'http://graphql.org/', description: 'The Best Query Language'
    Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client'
end

