class AddPasswordResetTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_created_at, :datetime
    add_column :users, :password_reset_tries_count, :integer, default: 0
    add_column :users, :password_token_tries_count  , :integer, default: 0
  end
end
