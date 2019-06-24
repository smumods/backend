class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :professor_review, null: true
      t.text :module_review
      t.boolean :is_anonymous, default: false
      t.integer :marking_score, null: true
      t.integer :engagement_score, null: true
      t.integer :fairness_score, null: true
      t.integer :workload_score, null: true
      t.belongs_to :user, foreign_key: true
      t.belongs_to :professor, foreign_key: true, null: true
      t.belongs_to :course, foreign_key: true, null: true

      t.timestamps
    end
  end
end
