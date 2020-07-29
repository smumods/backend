class AddOrderingToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :order, :integer, unique: true
  end
end
