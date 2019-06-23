class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :career
      t.string :grading_basis
      t.string :course_components
      t.string :campus
      t.string :academic_group
      t.string :academic_organization
      t.string :module_code
      t.float :credit_units
      t.text :description
      t.string :term
      t.string :academic_group_abbreviation
      t.string :module_code_front

      t.timestamps
    end
    add_index :courses, [:term, :module_code], unique: true
  end
end
