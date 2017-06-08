# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Member.destroy_all
User.destroy_all

user_attributes = [
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true,
    first_name: "Matt",
    last_name: "Lewis",
    city: "Paris",
    art_types: "photography",
    local_avatar: "matt.jpg",
    bio: "After five years in the army and an honest career in athletics (middle-distance running), Lewis became a coach. He used his other passion, photography, in his work as a trainer. He used his photos of the athletes to correct a stance, or analyse a stride. He took his destiny into his own hands a bit later on and decided that what had been a means would become an end. He set himself up as a photographer, sticking with his favourite subject matter and published his first photo in 1957 at the age of 28."
  },
  {
    email: "ora@gmail.com",
    password: "123456",
    admin: true,
    first_name: "Ora",
    last_name: "Akerman",
    city: "Paris",
    local_avatar: "ora.jpg",
    art_types: "photography",
    bio: "Ora was born in Wroclaw, Poland and lives and works in Brussels, Belgium. She studied painting at the Arts Academy of Wroclaw and printmaking at the Royale Academy of Fine Arts in Brussels.
"
  },
  {
    email: "clara@gmail.com",
    password: "123456",
    admin: true,
    first_name: "Clara",
    last_name: "Elbaz",
    city: "Paris",
    local_avatar: "clara.jpg",
    art_types: "space installation",
  },
  {
    email: "will@gmail.com",
    password: "123456",
    admin: true,
    first_name: "will",
    last_name: "Jackson",
    city: "Paris",
    local_avatar: "will.jpg",
    art_types: "drawing",
    bio:"When Chinese contemporary art makes us lose control, it is due to Will Jackson. Born in 1970 in China, in the Hu Bei province, he grew up and still lives in Beijing.
        A committed artist, Will jackson goes out of his way to realize confusing and vertiginous shots. A mix of performance and photography, his art challenges the laws of gravity. One sees the artist in preposterous positions, an unusual holler to our imagination. A loud cry, a cry for freedom. He also makes videos and installations.  "
  }
]


User.create!(user_attributes)
puts 'Finished!'

