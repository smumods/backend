namespace :events do
  desc 'Create a list of Events starting from the week to the end of the week. 24 each day for each hour'

  task populate: :environment do
    puts "Current event count: #{Event.count}"
    (Time.zone.now.prev_month.to_date..Time.zone.now.to_date).each do |date|
      year = date.year
      month = date.month
      day = date.day
      # Every 7 hours create an event so that each day has only 4 events
      (0...24).select { |h| h % 24 == 0 }.each do |hour|
        time = Time.new(year, month, day, hour).to_datetime
        file = File.open(File.join(Rails.root, "app/assets/images/smuai.jpeg"))
        Club.all.each do |club|
          event = Event.new(
            start_date: time,
            end_date: time.tomorrow,
            name: "Event for #{time.strftime("%d %b (%a) %l:%m %p")}",
            description: "Description for #{time.strftime("%d %b (%a) %l:%m %p")}",
            location: "Test Location",
            color: "background: rgba(7,64,249,0.70);",
            club: club,
            main_image: file
          )
          event.notify_of_event = false
          event.main_image.attach(io: file, filename: "smuai.jpeg")
          event.save
        end # end clubs
      end # end hours
    end # end dates
    puts "End event count: #{Event.count}"
  end # end task
end # end namespace
