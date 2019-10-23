Fabricator(:user) do
  name { Faker::Company.name }
  email { Faker::Internet.email }
  password "abgchdkgl567"
  password_confirmation "abgchdkgl567"
end
