# frozen_string_literal: true

class CreateRidges < ActiveRecord::Migration[5.2]
  def change
    create_table :ridges do |t|
      t.integer :area
      t.date :started_at
      t.date :ended_at
      t.references :user

      t.timestamps
    end
  end
end
