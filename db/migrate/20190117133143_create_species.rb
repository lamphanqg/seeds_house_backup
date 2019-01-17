# frozen_string_literal: true

class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.column :sowing_months, "bit(36)"
      t.column :harvest_months, "bit(36)"
      t.integer :days_to_harvest

      t.timestamps
    end

    create_table :companionships, id: false do |t|
      t.bigint :species_id
      t.bigint :friend_id

      t.timestamps
    end

    add_index(:companionships, [:species_id, :friend_id], unique: true)
    add_index(:companionships, [:friend_id, :species_id], unique: true)
  end
end
