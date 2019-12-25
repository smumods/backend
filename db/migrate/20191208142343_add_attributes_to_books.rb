class AddAttributesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :authors, :text
    add_column :books, :isbn, :string
    add_column :books, :is_used, :boolean
    add_column :books, :price, :float
    add_column :books, :description, :text
    add_column :books, :photos, :text
    add_column :books, :is_telegram_contact, :boolean
    add_column :books, :is_sold, :boolean, default: false
    add_reference :books, :course, foreign_key: true
    add_column :books, :uuid, :uuid, default: "gen_random_uuid()", null: false
  end
end
