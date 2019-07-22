class AddFieldsToTemporaryUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :temporary_users, :email, :string, unique: true
    add_column :temporary_users, :email_verification_token, :string, unique: true
    add_column :temporary_users, :email_verified, :boolean, default: false
    add_column :temporary_users, :login_token, :string
    add_index :temporary_users, :login_token, unique: true
    add_index :temporary_users, :email, unique: true
    add_index :temporary_users, :email_verification_token, unique: true
  end
end
