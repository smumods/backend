class AddCounterCacheToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :bookmarks_count, :integer, default: 0
  end
end
