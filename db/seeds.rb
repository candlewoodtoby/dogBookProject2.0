User.create!(name: "Admin",
              email: "admin@example.com",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true)

15.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@justanexample.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
