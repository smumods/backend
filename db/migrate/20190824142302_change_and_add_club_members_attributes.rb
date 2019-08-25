class ChangeAndAddClubMembersAttributes < ActiveRecord::Migration[5.2]
  def change
    change_column :club_members, :status, :string
    change_column_default :club_members, :status, from: nil, to: "Pending"
  end
end
