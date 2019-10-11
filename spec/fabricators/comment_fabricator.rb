Fabricator(:comment) do
  body { Faker::Quotes::Shakespeare }
  product { Fabricate(:product) }
  # user { Fabricate(:user) }
end