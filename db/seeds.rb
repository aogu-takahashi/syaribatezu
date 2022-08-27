# 10.times do
#   User.create(
#     name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "12345678",
#     password_confirmation: "12345678"
#   )
# end

# 20.times do
#   Mountain.create(
#     name: Faker::JapaneseMedia::DragonBall.character
#   )
# end

20.times do
  Prefecture.create(
    name: Faker::Address.state
  )
end