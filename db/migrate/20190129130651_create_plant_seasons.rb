# frozen_string_literal: true

class CreatePlantSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_seasons do |t|
      t.column :sow_months, "bit(36)"
      t.column :plant_months, "bit(36)"
      t.column :harvest_months, "bit(36)"
      t.belongs_to :species

      t.timestamps
    end

    change_table :species do |t|
      t.remove :sowing_months, :harvest_months, :days_to_harvest
      t.string :name
      t.string :family
    end
  end
end
