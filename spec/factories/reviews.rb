FactoryGirl.define do
  factory :review do
    title "MyString"
    body "MyText"
    user
    movie
    rating 1
  end
end
