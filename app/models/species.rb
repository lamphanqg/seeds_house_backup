# frozen_string_literal: true

class Species < ApplicationRecord
  has_and_belongs_to_many :friends,
                class_name: "Species",
                join_table: :companionships,
                foreign_key: :species_id,
                association_foreign_key: :friend_id
  has_many :ridges, through: :plants
  has_many :plant_seasons, dependent: :destroy
  validates :name, uniqueness: true

  def is_a_friend_of?(species)
    species.friends.include?(self)
  end
end
