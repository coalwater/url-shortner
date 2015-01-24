FactoryGirl.define do
  factory :url_hit do
    url_id {Faker::Number.between 1, 100}
  end

end
