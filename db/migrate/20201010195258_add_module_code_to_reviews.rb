class AddModuleCodeToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :module_code, :string
  end
end
