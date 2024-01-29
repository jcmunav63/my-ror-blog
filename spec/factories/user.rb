FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    photo { '' }
    posts_counter { 0 }
  end
end