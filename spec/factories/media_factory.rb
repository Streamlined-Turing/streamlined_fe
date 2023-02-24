FactoryBot.define do
  factory :media do
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end
