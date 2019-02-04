class ChangePlantSeasonColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :plant_seasons do |t|
      t.remove :sow_months, :plant_months, :harvest_months
      t.integer :sow_months_start
      t.integer :sow_months_end
      t.integer :plant_months_start
      t.integer :plant_months_end
      t.integer :harvest_months_start
      t.integer :harvest_months_end
    end
  end
end
