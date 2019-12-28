class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :telegram_id, :bigint
    add_column :users, :telegram_username, :string
    add_column :users, :telegram_picture, :string
  end
end
