class AddLongitudeToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :longitude, :float
  end
end
