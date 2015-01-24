FactoryGirl.define do
  factory :url do
    key {Faker::Lorem.characters(10)}
    original_url  {Faker::Internet.url('http://localhost')}
 end

end
