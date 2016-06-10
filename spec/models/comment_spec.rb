require 'rails_helper'

describe Comment do
  it "has a body present" do
    expect(build(:comment, data: "Good read!")).to_not be_valid
    expect(build(:comment, data: "")).to_not be_valid
  end

end
