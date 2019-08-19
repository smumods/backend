class AddClubAdminToClubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :clubs, :club_admin, foreign_key: true
  end
end
