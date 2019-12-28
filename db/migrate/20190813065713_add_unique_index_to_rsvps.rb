class AddUniqueIndexToRsvps < ActiveRecord::Migration[5.2]
  def change
    add_index :rsvps, [:user_id, :event_id], unique: true
  end
end
