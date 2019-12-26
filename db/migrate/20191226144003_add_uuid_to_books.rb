class AddUuidToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :uuid, :uuid, default: "gen_random_uuid()", null: false
    add_index :books, :uuid, unique: true
  end
end
