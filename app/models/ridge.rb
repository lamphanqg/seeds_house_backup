# frozen_string_literal: true

class Ridge < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :species, through: :plants
  validate :started_at_cannot_be_in_the_future,
           :ended_at_cannot_be_in_the_future

  def done?
    !ended_at.nil? && Date.current > ended_at
  end

  private
    def started_at_cannot_be_in_the_future
      if !started_at.nil? && started_at > Date.current
        errors.add(:started_at, "can't be in the future")
      end
    end

    def ended_at_cannot_be_in_the_future
      if !ended_at.nil? && ended_at > Date.current
        errors.add(:ended_at, "can't be in the future")
      end
    end
end
