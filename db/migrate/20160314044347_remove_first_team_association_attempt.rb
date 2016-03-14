class RemoveFirstTeamAssociationAttempt < ActiveRecord::Migration[5.0]
  def up
    remove_column :players, :first_team_id
  end

  def down
    add_column :players, :first_team_id, :integer
  end
end
