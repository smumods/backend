class CreateClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :clicks, id: :id do |t|
      t.string :target_type
      t.string :id_or_uuid
      t.string :caller_id_or_uuid
      t.text :additional_data

      t.timestamps
    end
  end
end
