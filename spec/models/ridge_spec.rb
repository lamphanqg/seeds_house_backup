# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ridge, type: :model do
  let(:user) { User.new(
                email: "dummy@gmail.com",
                password: "abcde12345"
              ) }
  let(:ridge) { Ridge.new(
                user: user,
                area: 5,
                started_at: Date.current - 5.days,
                ended_at: nil
              ) }

  it "is not done if ended_at is nil" do
    expect(ridge.done?).to be false
  end

  it "is done if ended" do
    ridge.ended_at = Date.yesterday
    expect(ridge.done?).to be true
  end

  it "is invalid if started_at is in the future" do
    ridge.started_at = Date.tomorrow
    expect(ridge.valid?).to be false
    expect(ridge.errors[:started_at]).to include("can't be in the future")
  end

  it "is invalid if ended_at is in the future" do
    ridge.ended_at = Date.tomorrow
    expect(ridge.valid?).to be false
    expect(ridge.errors[:ended_at]).to include("can't be in the future")
  end
end
