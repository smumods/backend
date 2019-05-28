# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (User.all.length == 0)
    (0..10).each do |i|
        unique_name = Faker::Name.unique.name.split(" ")
        first_name = unique_name[0]
        unique_name.delete_at(0)
        last_name = unique_name.join(" ")
        user = User.create(
            first_name: first_name, 
            last_name: last_name,
            email: "#{i}@example.com", 
            password: "password",
            password_confirmation: "password"
        )
        Book.create(title: Faker::Company.bs.titleize, user: user)
    end
end

if (Link.all.length == 0)
    Link.create url: 'http://graphql.org/', description: 'The Best Query Language'
    Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client'
end

