# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(0..10).each do |i|
    user = User.create(name: Faker::Name.unique.name, email: "#{i}@example.com")
    Book.create(title: Faker::Company.bs.titleize, user: user)
end