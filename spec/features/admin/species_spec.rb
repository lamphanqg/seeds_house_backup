# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Species", type: :feature, js: true do
  let(:admin_user) {
    User.create(
      email: "admin@dummy.com",
      password: "Admin12345",
      admin: true
    )
  }

  scenario "admin creates a new species" do
    visit root_path
    click_link "ログイン"
    fill_in "Email", with: admin_user.email
    fill_in "Password", with: admin_user.password
    click_button "Log in"
    visit admin_species_index_path

    expect {
      click_link "追加"
      fill_in :name, with: "キャベツ"
      fill_in :family, with: "アブラナ科"
      select "1月下旬", from: :sow_months_start
      select "2月上旬", from: :sow_months_end
      select "3月中旬", from: :plant_months_start
      select "3月下旬", from: :plant_months_end
      select "6月上旬", from: :harvest_months_start
      select "6月下旬", from: :harvest_months_end
      click_button "作成"
    }.to change { Species.count }.by(1)
  end
end
