class AddStatusAndChangeAttributesToRsvps < ActiveRecord::Migration[5.2]
  def change
    add_column :rsvps, :status, :string, default: "Attending"
    add_column :rsvps, :notes, :string, default: ""
    change_column_default :rsvps, :paid, from: nil, to: false
  end
end
