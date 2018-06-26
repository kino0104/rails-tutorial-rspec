FactoryGirl.define do
  factory :user do
    name "Michael Example"
    email "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
