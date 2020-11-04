class AddDurationFlagToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :is_long_interval, :boolean
  end
end
