class AddAdditionalDataToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :additional_data, :jsonb, default: {}
  end
end
