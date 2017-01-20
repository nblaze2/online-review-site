FactoryGirl.define do
  factory :review do
    title "That movie was just right."
    body "It wasn't too hot. It wasn't too cold. It was just right. It was a Goldylocks movie."
    user_id 1
    movie_id 1
    rating 85
  end
end
