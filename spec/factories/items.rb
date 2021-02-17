FactoryBot.define do
  factory :item do
    name {Faker::Name}
    description {Faker::Lorem.sentence}
    price {Faker::Number.number(digits: 6)}
    category_id {Faker::Number.within(range: 2..11)}
    state_id {Faker::Number.within(range: 2..7)}
    shipping_id {Faker::Number.within(range: 2..3)}
    area_id {Faker::Number.within(range: 2..48)}
    day_id {Faker::Number.within(range: 2..4)}
    association :user
    
    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
