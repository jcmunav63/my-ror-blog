FactoryBot.define do
  factory :comment do
    text { 'This is a comment.' }
    association :author, factory: :user
    association :post

    sequence(:created_at) { |n| Time.now - n.hours }
  end
end
