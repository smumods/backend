class RemoveAttributesFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :main_image
    remove_column :events, :gallery
  end
end
