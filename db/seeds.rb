if (Rails.env.development? and User.count == 0)
    (0..10).each do |i|
        unique_name = Faker::Name.unique.name.split(" ")
        first_name = unique_name[0]
        unique_name.delete_at(0)
        last_name = unique_name.join(" ")
        user = User.create(
            first_name: first_name, 
            last_name: last_name,
            email: "#{i}@sis.smu.edu.sg",
            password: "password",
            password_confirmation: "password",
            verified: true
        )
    end
end

# Create staging accounts with real emails because emails do get sent out!
if Rails.env.staging?
    User.create(
        first_name: "Gabriel", 
        last_name: "Chuan",
        email: "zhchuan.2016@sis.smu.edu.sg",
        password: "password",
        password_confirmation: "password",
        verified: true
    )
    User.create(
        first_name: "Zachery", 
        last_name: "Ng",
        email: "ng.zhenghao.2016@sis.smu.edu.sg",
        password: "password",
        password_confirmation: "password",
        verified: true
    )
end

if (Course.count == 0)
    puts "== Creating Professors and Courses now =="
    data_directory_location = "db/seeds/data"
    term_files = Dir.entries(data_directory_location).select { |e| !(e == '.' || e == '..') }
    term_files.each do |term_file_name|
        File.open("#{data_directory_location}/#{term_file_name}") do |term_file|
            begin
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
                        end
                        
                    end
                end
            rescue Exception => e
            end
        end
    end
end

if (ProfessorCourse.count == 0)
    puts "== Creating ProfessorCourses now =="
    data_directory_location = "db/seeds/data"
    term_files = Dir.entries(data_directory_location).select { |e| !(e == '.' || e == '..') }
    term_files.each do |term_file_name|
        begin
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
        rescue Exception => e
        end
    end
end
    
if ((Rails.env.development? or Rails.env.staging?) and Review.count == 0)
    Course.all.each do |course|
        with_professor = rand(2) == 1
        review_content = Faker::Lorem.paragraph(rand(70))
        if with_professor
            User.all.sample(rand(2)).each do |user|
                begin
                    review = Review.create!(
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
                rescue Exception => e
                    puts e
                end
            end
        else
            User.all.sample(rand(2)).each do |user|
                begin
                    review = Review.create!(
                        module_review: Faker::Lorem.paragraph(rand(70)),
                        is_anonymous: [true, false][rand(2)],
                        user: user,
                        course: course,
                        type_of_review: "mod"
                    )
                rescue Exception => e
                    puts e
                end
            end
        end
    end
end

if (Rails.env.development? or Rails.env.staging? and Book.count == 0)
    User.all.each do |user|
        (0...2).each do |i|
            Book.create(
                title: Faker::Book.title,
                user_id: user.id,
                authors: [Faker::Book.author, Faker::Book.author],
                isbn10: "1580117872",
                isbn13: "978-1580117876",
                is_used: true,
                price: 0,
                description: Faker::Lorem.paragraph_by_chars,
                photos: ["https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1442375726l/7366._SY475_.jpg", "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1386924417l/201616.jpg"],
                is_telegram_contact: [true, false].sample,
                is_sold: [true, false].sample,
                course_id: Course.first.id
            )
        end
    end
end

if(Rails.env.development? and User.find_by(email:"hello@smumods.com").nil?)
    user = User.new(first_name: "Anonymous", last_name: "", email: "hello@smumods.com", password: "superlongpassword", password_confirmation: "superlongpassword", verified: true)
    user.save(validate: false)
    AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if (Rails.env.development? or Rails.env.staging?) if AdminUser.count == 0
end
# AdminUser.create!(email: 'hello@smumods.com', password: '', password_confirmation: 'password') if Rails.env.production?