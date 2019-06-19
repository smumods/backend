desc "Load courses data from data folder in lib/data into the database"

task load_courses_data: :environment do
    puts "== load_courses_data =="
    binding.pry
    data_directory_location = "lib/tasks/data"
    term_files = Dir.entries(data_directory_location).select { |e| !(e == '.' || e == '..') }
    term_files.each do |term_file_name|
        File.open("#{data_directory_location}/#{term_file_name}") do |term_file|
            term_file_contents = term_file.read
            courses_data = JSON.parse(term_file_contents)
        end
    end
end