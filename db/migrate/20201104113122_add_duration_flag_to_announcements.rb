class AddDurationFlagToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :is_long_duration, :boolean, default: false
  end
end
