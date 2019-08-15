class CreateClubMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :club_members do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :club, foreign_key: true
      t.integer :status
      t.string :notes

      t.timestamps
    end
  end
end
