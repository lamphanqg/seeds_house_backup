# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with an email, and password" do
    user = User.new(email: "dummy@gmail.com", password: "abcde12345")
    expect(user).to be_valid
  end

  it "is invalid if email is empty" do
    user = User.new(email: nil)
    user.valid?
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid if email does not have email format" do
    user = User.new(email: "abcde")
    user.valid?
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("is invalid")
  end

  it "is invalid if password has less than 6 characters" do
    user = User.new(email: "dummy@gmail.com", password: "12345")
    user.valid?
    expect(user).not_to be_valid
    expect(user.errors[:password].join).to include("is too short")
  end

  it "is invalid if password has more than 128 characters" do
    user = User.new(email: "dummy@gmail.com", password: "a" * 129)
    user.valid?
    expect(user).not_to be_valid
    expect(user.errors[:password].join).to include("is too long")
  end
end
