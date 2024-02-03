FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Test User #{n}" }
    bio do
      'Lorem ipsum dolor sit amet,
      consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      Ac tortor dignissim convallis aenean et. Lectus magna fringilla urna porttitor rhoncus dolor.
      Consequat interdum varius sit amet mattis vulputate. Fringilla urna porttitor rhoncus dolor
      purus non enim.'
    end
  end
end
