class CreateUnrsvps < ActiveRecord::Migration[5.2]
  def change
    create_table :unrsvps do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :event, foreign_key: true
      t.boolean :paid, default: false
      t.string :status, default: "Unrsvped"
      t.string :notes, default: ""

      t.timestamps
    end
  end
end
