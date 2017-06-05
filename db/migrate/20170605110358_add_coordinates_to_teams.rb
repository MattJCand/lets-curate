class AddCoordinatesToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :latitude, :float
    add_column :teams, :longitude, :float
  end
end
