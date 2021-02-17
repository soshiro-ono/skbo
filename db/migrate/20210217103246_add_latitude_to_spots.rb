class AddLatitudeToSpots < ActiveRecord::Migration[6.0]
  def change
    add_column :spots, :latitude, :float
  end
end
