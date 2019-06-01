class MovePlantSeasonIntoSpecies < ActiveRecord::Migration[5.2]
  def change
    drop_table :plant_seasons

    add_column :species, :sow_months_start, :integer
    add_column :species, :sow_months_end, :integer
    add_column :species, :plant_months_start, :integer
    add_column :species, :plant_months_end, :integer
    add_column :species, :harvest_months_start, :integer
    add_column :species, :harvest_months_end, :integer
  end
end
