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
        time = Time.new(year, month, day, hour)
        Club.all.each do |club|
          Event.create!(
            start_date: time,
            end_date: time.tomorrow,
            name: "Event for #{time.strftime("%d %b (%a) %l:%m %p")}",
            description: "Description for #{time.strftime("%d %b (%a) %l:%m %p")}",
            main_image: "test_main_image.jpg",
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
