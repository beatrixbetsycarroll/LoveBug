require 'Faker'

hair_color_choices = %w(blonde brown red)
eye_color_choices = %w(green brown blue)
race_choices = %w(martian venutian)
std_choices = %w(HIV Herpes HPV Warts)
religion_choices = %w(scientologist pastafarian luvism)
genders = ["male", "female"]


# create users
users = []
20.times do
  users << User.create(  first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                user_name: Faker::App.name,
                email: Faker::Internet.email,
                location: Faker::Address.city,
                hair_color: hair_color_choices.sample,
                eye_color: eye_color_choices.sample,
                race: race_choices.sample,
                religion: religion_choices.sample,
                age: rand(18..65),
                about: Faker::Lorem.paragraph(2),
                photo: "http://placehold.it/250x250",
                weight: rand(120..250),
                height: rand(50..80),
                photo: "http://placehold.it/250x250",
                gender: genders.sample,
                looking_for: genders.sample,
                password: "a"
                )
end

# create stds

Std.create(name: "HIV")
Std.create(name: "Herpes")
Std.create(name: "Warts")
Std.create(name: "HPV")

# create user std relationships

users.each do |user|
  user.stds << Std.all.sample
end

# create messages

users.each do |user|
  user.messages.create(content: Faker::Lorem.sentence(5), receiver_id: rand(1..10))
end

