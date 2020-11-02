class AddPositionToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :position, :integer
    
    Announcement.all.each do |announcement|
      announcement.update_column :position, announcement.order
    end
  end
end
