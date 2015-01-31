FactoryGirl.define do
  factory :url_hit do
    url_id {Faker::Number.between 1, 100}
    ip { Faker::Internet.ip_v4_address }
    referrer { Faker::Internet.url }
  end

end
