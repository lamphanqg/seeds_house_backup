# frozen_string_literal: true

class Species < ApplicationRecord
  has_and_belongs_to_many :friends,
                class_name: "Species",
                join_table: :companionships,
                foreign_key: :species_id,
                association_foreign_key: :friend_id
  has_many :ridges, through: :plants
  validates :name, uniqueness: true

  after_save :save_companions

  def is_a_friend_of?(species)
    species.friends.include?(self)
  end

  private
    def save_companions
      friends.each do |friend|
        if !friend.friends.include?(self)
          friend.friends << self
          friend.save!
        end
      end
    end
end
