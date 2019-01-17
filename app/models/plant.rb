# frozen_string_literal: true

class Plant < ApplicationRecord
  belongs_to :ridge, dependent: :destroy
  belongs_to :species, dependent: :destroy
end
