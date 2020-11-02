class AddAttributesToAnnouncement < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :is_direct_link, :boolean
    add_column :announcements, :target_link, :string
  end
end
