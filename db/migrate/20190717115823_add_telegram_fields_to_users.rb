class AddTelegramFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :old_system, :boolean, default: true
    add_column :users, :old_system_verified, :boolean, default: false
    add_column :users, :telegram_email_verification_token, :string
    add_column :users, :telegram_id, :integer, unique: true
    add_index :users, :telegram_email_verification_token, unique: true
    add_index :users, :telegram_id, unique: true
  end
end
