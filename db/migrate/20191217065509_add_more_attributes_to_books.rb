class AddMoreAttributesToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :isbn, :isbn10
    add_column :books, :isbn13, :string
  end
end
