class CreateRsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :rsvps do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
