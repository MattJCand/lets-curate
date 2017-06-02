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
    password_confirmation: "123456",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2015-02-06 14:02:10",
    last_sign_in_at: "2015-02-06 14:02:10",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1",
    admin: true
  },
  {
    email: "aurore@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2015-02-06 14:03:01",
    last_sign_in_at: "2015-02-06 14:03:01",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1",
    admin: true
    },
     {
    email: "maurice@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2015-02-06 14:03:01",
    last_sign_in_at: "2015-02-06 14:03:01",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1",
    admin: false
    },
     {
    email: "clara@gmail.com",
    password: "testuseraccount",
    password_confirmation: "testuseraccount",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2015-02-06 14:03:01",
    last_sign_in_at: "2015-02-06 14:03:01",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1",
    admin: false
    },
     {
    email: "serge@gmail.com",
    password: "testuseraccount",
    password_confirmation: "testuseraccount",
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    sign_in_count: 1,
    current_sign_in_at: "2015-02-06 14:03:01",
    last_sign_in_at: "2015-02-06 14:03:01",
    current_sign_in_ip: "127.0.0.1",
    last_sign_in_ip: "127.0.0.1",
    admin: false
    }
]
User.create!(user_attributes)
puts 'Finished!'

