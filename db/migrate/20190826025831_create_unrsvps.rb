class CreateUnrsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :unrsvps do |t|
      t.uuid :user, foreign_key: true, type: :uuid
      t.uuid :event, foreign_key: true, type: :uuid
      t.boolean :paid, default: false
      t.string :status, default: "Unrsvped"
      t.string :notes, default: ""

      t.timestamps
    end
  end
end
