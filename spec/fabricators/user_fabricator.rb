Fabricator(:user) do
  name { Faker::Company.name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
end
