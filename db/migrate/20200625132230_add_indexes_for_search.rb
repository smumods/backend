class AddIndexesForSearch < ActiveRecord::Migration[6.0]
  def change
    add_index :courses, "lower(name) varchar_pattern_ops", name: "index_on_courses_name"
    add_index :professors, "lower(name) varchar_pattern_ops", name: "index_on_professors_name"
  end
end
