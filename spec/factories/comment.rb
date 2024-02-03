FactoryBot.define do
  factory :comment do
    text { 'This is a comment.' }
    association :author, factory: :user
    association :post
  end
end
