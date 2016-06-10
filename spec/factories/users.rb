FactoryGirl.define do
  factory :user do
    f_name "Regina"
    l_name "Phalange"
    sequence(:email) { |n| "regina.phalange#{n}@email.com" }
    address "Central Perk, New York"
    phone "235465343"
    password "password"
  end

  factory :invalid_user do
    f_name nil
  end
end

