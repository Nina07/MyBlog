require 'rails_helper'

describe Blog do
  it "has a valid factory" do
    expect(create(:blog)).to be_valid
  end
  it "is invalid without a category" do
    expect(create(:blog, category: "Science-Fiction")).to be_valid
    expect(build(:blog, category: "")).to_not be_valid
  end
  it "is invalid without a title" do
    expect(create(:blog, title: "Area 51")).to be_valid
    expect(build(:blog, title: "")).to_not be_valid
  end
  it "is invalid without a body" do
    expect(create(:blog, body: "Area 51 is a suspicious ground on the belief of being a location where Americans perform experiments regarding alien invasions.")).to be_valid
    expect(build(:blog, body: "")).to_not be_valid
  end
end
