class AddApiKeyToPlayers < ActiveRecord::Migration[5.0]
  def up
    add_column :players, :api_key, :string
    Player.all.each{ |player| player.update(api_key: player.generate_api_key) }
  end

  def down
    remove_column :players, :api_key
  end
end
