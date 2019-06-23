class AddSlugToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :slug, :string
    add_index :professors, :slug, unique: true
  end
end
