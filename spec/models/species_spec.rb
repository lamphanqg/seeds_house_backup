# frozen_string_literal: true

require "rails_helper"

RSpec.describe Species, type: :model do
  let(:cabbage_season) {
    PlantSeason.create(
      sow_months: "0" * 2 + "1" * 2 + "0" * 32,
      plant_months: "0" * 7 + "1" * 2 + "0" * 27,
      harvest_months: "0" * 15 + "1" * 4 + "0" * 17
    )
  }

  let(:letuce_season) {
    PlantSeason.create(
      sow_months: "0" * 1 + "1" * 3 + "0" * 32,
      plant_months: "0" * 6 + "1" * 3 + "0" * 27,
      harvest_months: "0" * 13 + "1" * 3 + "0" *20
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
