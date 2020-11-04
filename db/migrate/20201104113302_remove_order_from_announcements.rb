class RemoveOrderFromAnnouncements < ActiveRecord::Migration[6.0]
  def change
    remove_column :announcements, :order
  end
end
