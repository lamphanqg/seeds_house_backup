# frozen_string_literal: true

class Ridge < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :species, through: :plants
end
