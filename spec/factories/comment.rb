FactoryBot.define do
  factory :comment do
    text { 'This is a comment.' }
    association :user
    association :post
  end
end
