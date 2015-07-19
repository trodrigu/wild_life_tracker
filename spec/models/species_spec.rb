require 'rails_helper'

describe Species do
  it "is valid with a name" do
    species = build(:species)
    expect(species).to be_valid
  end

  it "is invalid without a name" do
    species = build(:species, name: nil)
    species.valid?
    expect(species.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    create(:species, name: 'wolf')
    species = build(:species, name: 'wolf')
    species.valid?
    expect(species.errors[:name]).to include("has already been taken")
  end
end
