class AddUuidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uuid, :uuid, default: "uuid_generate_v4()", null: false
  end
end
