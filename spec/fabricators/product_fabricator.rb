Fabricator(:product) do
  name { Faker::App.name }
  description { Faker::Company.catch_phrase }
  user { Fabricate(:user) }
end

Fabricator(:product_with_tag, from: :product) do
  tag_list { Faker::IndustrySegments.sector }
end