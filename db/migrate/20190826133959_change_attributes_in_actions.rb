class ChangeAttributesInActions < ActiveRecord::Migration[5.2]
  def change
    change_column :actions, :target_id, :uuid
  end
end
