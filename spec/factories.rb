FactoryBot.define do
  factory :user do
    address { "23 Rue Thier, 06000 Nice" }
    name { 'Toto' }
    password { "azerty" }
    email { "toto@mail.com" }
  end

  factory :tattoo do
    user
  end
end
