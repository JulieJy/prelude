# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'I destroy all users'
User.destroy_all

p 'I create 2 users'
user1 = User.create!(
  first_name: "Pedro",
  last_name: "Matanzo",
  email: "pedro@pedro.com",
  address: "Madrid",
  phone_number:"555-345-322",
  password: "secret")


user2 = User.create!(
  first_name: "Julie",
  last_name: "Jaumary",
  email: "julie@julie.com",
  address: "20 rue des capucins, Lyon",
  phone_number:"555-345-322",
  password: "secret")

