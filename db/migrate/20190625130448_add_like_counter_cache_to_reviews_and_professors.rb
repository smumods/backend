class AddLikeCounterCacheToReviewsAndProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :bookmarks_count, :integer, default: 0
    add_column :professors, :bookmarks_count, :integer, default: 0
  end
end
