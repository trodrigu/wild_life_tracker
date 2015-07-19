require 'rails_helper'

describe SpeciesPic do
  it "is valid with an avatar" do
    pic = build(:species_pic)
    expect(pic).to be_valid
  end

  it { should have_attached_file(:avatar) }
  it { should validate_attachment_presence(:avatar) }
  it { should validate_attachment_content_type(:avatar).
       allowing('image/png', 'image/gif', 'image/jpeg').
       rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:avatar).
       less_than(2.megabytes) }
end 
