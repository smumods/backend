class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :key

      t.timestamps
    end
    add_index :sessions, :key, unique: true
  end
end
