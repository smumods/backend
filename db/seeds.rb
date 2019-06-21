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
    puts "== Creating Professors and Courses now =="
    data_directory_location = "db/seeds/data"
    term_files = Dir.entries(data_directory_location).select { |e| !(e == '.' || e == '..') }
    term_files.each do |term_file_name|
        File.open("#{data_directory_location}/#{term_file_name}") do |term_file|
            term_file_contents = term_file.read
            courses_data = JSON.parse(term_file_contents)
            courses_data.keys.each do |term|
                courses_data[term].keys.each do |module_code|
                    courses_info_data = courses_data[term][module_code]["data"]
                    courses_info_data["info_instructors"].each do |instructor_name|
                        Professor.find_or_create_by(name: instructor_name.strip.squeeze(' '))
                    end
                    Course.create!({
                        module_code: module_code,
                        name: courses_data[term][module_code]["name"],
                        career: courses_info_data["info_career"],
                        grading_basis: courses_info_data["info_grading_basis"],
                        course_components: courses_info_data["info_course_components"],
                        campus: courses_info_data["info_campus"],
                        academic_group: courses_info_data["info_academic_group"],
                        academic_organization: courses_info_data["info_academic_organization"],
                        credit_units: courses_info_data["info_units"],
                        description: courses_info_data["info_description"],
                        term: term
                    })
                    
                end
            end
        end
    end
end

if (ProfessorCourse.all.length == 0)
    puts "== Creating ProfessorCourses now =="
    data_directory_location = "db/seeds/data"
    term_files = Dir.entries(data_directory_location).select { |e| !(e == '.' || e == '..') }
    term_files.each do |term_file_name|
        File.open("#{data_directory_location}/#{term_file_name}") do |term_file|
            term_file_contents = term_file.read
            courses_data = JSON.parse(term_file_contents)
            courses_data.keys.each do |term|
                courses_data[term].keys.each do |module_code|
                    courses_info_data = courses_data[term][module_code]["data"]
                    course = Course.find_by_module_code(module_code)
                    courses_info_data["info_instructors"].each do |instructor_name|
                        begin
                            professor = Professor.find_by_name(instructor_name)
                            ProfessorCourse.create!(course: course, professor: professor)
                        rescue Exception => e
                        end
                    end
                end
            end
        end
    end
end

if (Review.all.length == 0)
    (0..30).each do |i|
        with_professor = rand(2) == 1
        if with_professor
            Review.create(
                professor_review: Faker::Lorem.paragraph ,
                module_review: Faker::Lorem.paragraph,
                is_anonymous: [true, false][rand(2)],
                marking_score: rand(6),
                engagement_score: rand(6),
                fairness_score: rand(6),
                workload_score: rand(6),
                user: User.find(User.all.ids[rand(User.all.ids.count)]),
                professor: Professor.find(Professor.all.ids[rand(Professor.all.ids.count)]),
                course: Course.find(Course.all.ids[rand(Course.all.ids.count)])
            )
        else
            Review.create(
                module_review: Faker::Lorem.paragraph,
                is_anonymous: [true, false][rand(2)],
                user: User.find(User.all.ids[rand(User.all.ids.count)]),
                course: Course.find(Course.all.ids[rand(Course.all.ids.count)])
            )
        end
    end
end

course = Course.create!({
    name: "Independent Study",
    career: "Graduate - PhD Business (FNCE)",
    grading_basis: "Graded",
    course_components: "Independent Study Required",
    campus: "Main Campus",
    academic_group: "Lee Kong Chian Sch of Business",
    academic_organization: "LKCSB GPO",
    module_code: "IDST704",
    credit_units: 1.0,
    description:
    "Each independent study is a one-on-one research tutorial between the student and a selected faculty, on a topic mutually agreed upon by the student and the faculty. A research term paper is required in each independent study.",
    term: "2018-19 Term 2",
})

Review.create!(
    module_review: Faker::Lorem.paragraph,
    is_anonymous: [true, false][rand(2)],
    user: User.find(User.all.ids[rand(User.all.ids.count)]),
    course: Course.where(module_code: "IDST704", term: "2018-19 Term 2")
)

Review.create!(
    module_review: Faker::Lorem.paragraph,
    is_anonymous: [true, false][rand(2)],
    user: User.find(User.all.ids[rand(User.all.ids.count)]),
    course: course
)