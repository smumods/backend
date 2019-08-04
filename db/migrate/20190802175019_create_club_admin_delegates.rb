class CreateClubAdminDelegates < ActiveRecord::Migration[5.2]
  def change
    create_table :club_admin_delegates, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :club, foreign_key: true

      t.timestamps
    end
  end
end
