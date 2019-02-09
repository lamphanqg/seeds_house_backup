# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Species", type: :feature, js: true do
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

  scenario "display species list page" do
    species_array = [cabbage, letuce]
    visit species_index_path

    species_array.each do |species|
      expect(page).to have_text(species.name)
      expect(page).to have_text(species.family)
    end
  end
end
