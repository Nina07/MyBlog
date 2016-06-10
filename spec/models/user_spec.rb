require 'rails_helper'

describe User do
  it "has a valid first name" do
    expect(create(:user, f_name: "Ken")).to be_valid
    expect(build(:user, f_name: "")).to_not be_valid
  end

  it "has a valid last name" do
    expect(create(:user, l_name: "Adams")).to be_valid
    expect(build(:user, l_name: "")).to_not be_valid
  end

  it "has a valid address" do
    expect(create(:user, address: "NY, USA")).to be_valid
    expect(build(:user, address: "")).to_not be_valid
  end

  it "has a valid phone number" do
    expect(create(:user, phone: "345454")).to be_valid
    expect(build(:user, phone: "fdgdfgdg")).to_not be_valid
  end

  it "has a unique email id" do
    expect(create(:user, email: "ken.adams@email.com")).to be_valid
    expect(build(:user, email: "ken.adams@email.com")).to_not be_valid
  end

  it "has a six length character password" do
    expect(create(:user, password: "password")).to be_valid
    expect(build(:user, password: "pass")).to_not be_valid
    expect(build(:user, password: "passw")).to_not be_valid
  end
  #check the instance method
  it "returns full name of a user separated by white space" do
    expect(create(:user, f_name: "Alice", l_name: "Joe").full_name == "Alice Joe").to be_truthy
    expect(build(:user, f_name: "Alan", l_name: "Harper").full_name == "Alan harper").to be_falsy
  end
end
