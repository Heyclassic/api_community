Fabricator(:product) do
  name { Faker::App.name }
  description { Faker::Company.catch_phrase }
  user { Fabricate(:user) }
end
