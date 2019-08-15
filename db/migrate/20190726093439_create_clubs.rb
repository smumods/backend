class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :slug
      t.string :display_picture
      t.text :gallery
      t.text :description
      t.text :social_media

      t.timestamps
    end
    add_index :clubs, :name, unique: true
    add_index :clubs, :slug, unique: true
  end
end
