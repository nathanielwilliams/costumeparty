User.create!(name:  "Nathaniel Williams",
             email: "nathaniel.williams@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Jinesea Lewis",
            email: "jinesea.lewis@gmail.com",
            password:              "foobar",
            password_confirmation: "foobar")

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end
