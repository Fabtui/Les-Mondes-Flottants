FactoryBot.define do
  factory :flash do
    name { "MyString" }
    description { "MyText" }
    client { "MyString" }
    date { "2023-03-28" }
    user { nil }
  end
end
