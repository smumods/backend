class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :main_image
      t.text :gallery
      t.string :color
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.float :price
      t.boolean :require_rsvp, default: false
      t.datetime :rsvp_by
      t.belongs_to :club, foreign_key: true

      t.timestamps
    end
  end
end
