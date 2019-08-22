class RemoveAttributesFromClub < ActiveRecord::Migration[5.2]
  def change
    remove_column :clubs, :display_picture
    remove_column :clubs, :gallery
  end
end
