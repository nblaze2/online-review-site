FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "Police Academy #{n}" }
    sequence(:year) { |n| "198#{n + 3}" }
    user_id 1
  end
end
