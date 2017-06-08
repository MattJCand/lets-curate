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
    admin: true
  },
  {
    email: "aurore@gmail.com",
    password: "123456",
    admin: true
    },
     {
    email: "maurice@gmail.com",
    password: "123456",
    admin: false
    },
     {
    email: "clara@gmail.com",
    password: "testuseraccount",
    admin: false
    },
     {
    email: "serge@gmail.com",
    password: "testuseraccount",
    admin: false
    },
    {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  },
  {
    email: "mathieu@gmail.com",
    password: "123456",
    admin: true
  }
]

User.create!(user_attributes)
puts 'Finished!'

