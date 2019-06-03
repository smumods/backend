class CreateTemporaryUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :temporary_users do |t|
      t.string :ip_address
      t.string :session_token
      t.string :telegram_id

      t.timestamps
    end
  end
end
