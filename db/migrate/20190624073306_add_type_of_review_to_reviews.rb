class AddTypeOfReviewToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :type_of_review, :string
  end
end
