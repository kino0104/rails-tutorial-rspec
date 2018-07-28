FactoryGirl.define do
  factory :user do
    name "Michael Example"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  
  trait :archer do
    name "Sterling Archer"
    email "duchess@example.gov"
  end
end
