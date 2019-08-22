namespace :events do
  desc 'Create a list of Events starting from the week to the end of the week. 24 each day for each hour'

  task populate: :environment do
    puts "Current event count: #{Event.count}"
    (Time.zone.now.prev_month.to_date..Time.zone.now.at_end_of_week.to_date).each do |date|
      year = date.year
      month = date.month
      day = date.day
      # Every 7 hours create an event so that each day has only 4 events
      (0...24).select { |h| h % 7  == 0 }.each do |hour|
        time = Time.new(year, month, day, hour).to_datetime
        Club.all.each do |club|
          event = Event.create(
            start_date: time,
            end_date: time.tomorrow,
            name: "Event for #{time.strftime("%d %b (%a) %l:%m %p")}",
            description: "Description for #{time.strftime("%d %b (%a) %l:%m %p")}",
            main_image: "https://smumods.sgp1.digitaloceanspaces.com/h2mVL2s1csQhkqmekqhCP4fB?response-content-disposition=inline%3B%20filename%3D%22photo_2019-08-22%2011.31.33.jpeg%22%3B%20filename%2A%3DUTF-8%27%27photo_2019-08-22%252011.31.33.jpeg&response-content-type=image%2Fjpeg&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=7YHYT4XNV2C7UMGZ765R%2F20190822%2Fsgp1%2Fs3%2Faws4_request&X-Amz-Date=20190822T043846Z&X-Amz-Expires=300&X-Amz-SignedHeaders=host&X-Amz-Signature=f412ae7e11d684b9c8ccdb0878ef2b43cba27b30ddda800e35fdc64c61038407",
            location: "Test Location",
            color: "background: rgba(7,64,249,0.70);",
            club: club
          )
        end # end clubs
      end # end hours
    end # end dates
    puts "End event count: #{Event.count}"
  end # end task
end # end namespace
