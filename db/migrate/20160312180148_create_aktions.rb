class CreateAktions < ActiveRecord::Migration[5.0]
  def change
    create_table :aktions do |t|
      t.datetime :timeslot
      t.string :focus
      t.integer :player_id

      t.timestamps
    end
  end
end
