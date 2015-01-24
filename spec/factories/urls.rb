FactoryGirl.define do
  factory :url do
    key {Faker::Lorem.characters(10)}
    original_url  {Faker::Internet.url('localhost:3000')}
 end

end
