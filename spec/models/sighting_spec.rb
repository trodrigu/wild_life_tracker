require 'rails_helper'

describe Sighting do
  it "is valid with a location and date" do
    sighting = build(:sighting)
    expect(sighting).to be_valid
  end

  it "is invalid without a location" do
    sighting = build(:sighting, location: nil)
    sighting.valid?
    expect(sighting.errors[:location]).to include("can't be blank")
  end
end

