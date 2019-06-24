# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (User.count == 0)
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

if (Link.count == 0)
    Link.create url: 'http://graphql.org/', description: 'The Best Query Language', user: User.first
    Link.create url: 'http://dev.apollodata.com/', description: 'Awesome GraphQL Client', user: User.first
end

if (Course.count == 0)
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
                        Professor.find_or_create_by(name: instructor_name.strip.squeeze(' ')) if instructor_name != "Staff"
                    end
                    begin
                        Course.find_or_create_by!(module_code: module_code, term: term) do |c|
                            c.name = courses_data[term][module_code]["name"]
                            c.career = courses_info_data["info_career"]
                            c.grading_basis = courses_info_data["info_grading_basis"]
                            c.course_components = courses_info_data["info_course_components"]
                            c.campus = courses_info_data["info_campus"]
                            c.academic_group = courses_info_data["info_academic_group"]
                            c.academic_organization = courses_info_data["info_academic_organization"]
                            c.credit_units = courses_info_data["info_units"]
                            c.description = courses_info_data["info_description"]
                            c.academic_group_abbreviation = Course.academic_group_abbreviation(courses_info_data["info_academic_group"])
                            c.module_code_front = Course.module_code_front(module_code)
                        end
                    rescue Exception => e
                        binding.pry
                    end
                    
                end
            end
        end
    end
end

if (ProfessorCourse.count == 0)
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
                    course = Course.where(module_code: module_code, term: term).first
                    courses_info_data["info_instructors"].each do |instructor_name|
                        begin
                            if instructor_name != "Staff"
                                professor = Professor.find_by_name(instructor_name)
                                ProfessorCourse.find_or_create_by!(course: course, professor: professor)
                            end
                        rescue Exception => e
                        end
                    end
                end
            end
        end
    end
end

if (Review.count == 0)
    Course.all.each do |course|
        with_professor = rand(2) == 1
        review_content = Faker::Lorem.paragraph(rand(70))
        if with_professor
            User.all.sample(rand(3)).each do |user|
                Review.create!(
                    professor_review: Faker::Lorem.paragraph ,
                    module_review: Faker::Lorem.paragraph,
                    is_anonymous: [true, false][rand(2)],
                    marking_score: rand(5) + 1,
                    engagement_score: rand(5) + 1,
                    fairness_score: rand(5) + 1,
                    workload_score: rand(5) + 1,
                    user: user,
                    professor: course.professors.sample(1).first,
                    course: course,
                    type_of_review: "prof"
                )
            end
        else
            User.all.sample(rand(3)).each do |user|
                Review.create!(
                    module_review: Faker::Lorem.paragraph(rand(70)),
                    is_anonymous: [true, false][rand(2)],
                    user: user,
                    course: course,
                    type_of_review: "mod"
                )
            end
        end
    end
end

Review.create!(
    module_review: Faker::Lorem.paragraph,
    is_anonymous: [true, false][rand(2)],
    user: User.find(User.all.ids[rand(User.all.ids.count)]),
    course: Course.where(module_code: "IDST704", term: "2018-19 Term 2").first
)

Review.create!(
    module_review: Faker::Lorem.paragraph,
    is_anonymous: [true, false][rand(2)],
    user: User.find(User.all.ids[rand(User.all.ids.count)]),
    course: Course.where(module_code: "IDST704", term: "2018-19 Term 2").first
)