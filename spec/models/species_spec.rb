# frozen_string_literal: true

require "rails_helper"

RSpec.describe Species, type: :model do
  let(:cabbage_season) {
    PlantSeason.create(
      sow_months_start: 3,
      sow_months_end: 4,
      plant_months_start: 8,
      plant_months_end: 9,
      harvest_months_start: 16,
      harvest_months_end: 19
    )
  }

  let(:letuce_season) {
    PlantSeason.create(
      sow_months_start: 2,
      sow_months_end: 4,
      plant_months_start: 7,
      plant_months_end: 9,
      harvest_months_start: 14,
      harvest_months_end: 16
    )
  }


  let(:cabbage) {
    Species.create(name: "キャベツ", family: "アブラナ科", plant_seasons: [cabbage_season])
  }

  let(:letuce) {
    Species.create(name: "レタス", family: "キク科", plant_seasons: [letuce_season])
  }

  it "is valid with a name, a family, a plant season" do
    expect(cabbage).to be_valid
  end

  it "can have a companion plant" do
    cabbage.friends << letuce
    expect(letuce.save! && cabbage.save! && letuce.is_a_friend_of?(cabbage)).to be true
  end
end
