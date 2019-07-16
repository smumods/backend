class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.datetime :valid_from
      t.datetime :expires_on
      t.string :main_image
      t.text :additional_images, array: true, default: []
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
