# frozen_string_literal: true

class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :planted_number
      t.date :sowed_at
      t.date :planted_at
      t.belongs_to :species, index: true
      t.belongs_to :ridges, index: true

      t.timestamps
    end
  end
end
