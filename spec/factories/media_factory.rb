FactoryBot.define do
  factory :media do
    title { Faker::Movie.title }

    initialize_with { new(**attributes) }
  end
end
