class CreateProfessorCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :professor_courses do |t|
      t.references :professor, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
