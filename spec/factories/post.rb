FactoryBot.define do
  factory :post do
    title { 'Test Post' }
    text { 'This is a test post.' }
    association :author, factory: :user
  end
end
