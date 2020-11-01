class AddCoursesAndProfessorDataFor202021Sem1 < ActiveRecord::Migration[6.0]
  def change
    puts "== Creating Professors and Courses now =="
    puts "Before: #{Professor.count} professors"
    data_location = "db/seeds/data/2020-21 Term 1"
    begin
      File.open(data_location) do |term_file|
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
      end
      puts "After: #{Professor.count} professors"
    rescue Exception => e
    end

    puts "== Creating ProfessorCourses now =="
    begin
      puts "Before: #{ProfessorCourse.count} professor_courses"
      File.open(data_location) do |term_file|
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
    puts "After: #{ProfessorCourse.count} professor_courses"
  end
end
