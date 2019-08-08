namespace :events do
  desc 'Create a list of Events starting from the week to the end of the week. 24 each day for each hour'

  task populate: :environment do
    (Date.today.at_beginning_of_week..Date.today.at_end_of_week).each do |date|
      year = date.year
      month = date.month
      day = date.day
      (0...24).each do |hour|
        time = Time.new(year, month, day, hour)
        Event.create(
          start_date: time,
          end_date: time.tomorrow,
          name: "Event for #{time.strftime("%d %b (%a) %l:%m %p")}",
          description: "Description for #{time.strftime("%d %b (%a) %l:%m %p")}",
          club: Club.first
        )
      end
    end
  end

end
