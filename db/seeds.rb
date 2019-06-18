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

if (Course.all.length == 0)
    (0..20).each do |i|
        Course.create(
            name: Faker::FunnyName.name,
            career: "Undergraduate",
            grading_basis: "Graded",
            course_components: "Seminar Required",
            campus: "Main Campus",
            academic_group: "School Of Social Sciences",
            academic_organization: "School of Social Sciences",
            module_code: "IS202",
            credit_units: 1.0,
            description: Faker::Books::Lovecraft.paragraph(2)
        )
    end
end

if (Professor.all.length == 0)
    (0..30).each do |i|
        Professor.create(
            name: Faker::GreekPhilosophers.name
        )
    end
end