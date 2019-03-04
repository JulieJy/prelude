# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require_relative '../app/services/scrapping.rb'
p 'I destroy all libraries'
Library.destroy_all
p 'I destroy all participants'
Participant.destroy_all
p 'I destroy all games'
Game.destroy_all
p 'I destroy all users'
User.destroy_all
p 'I destroy all bars'
Bar.destroy_all


p 'I create 2 users'
user1 = User.create!(
  first_name: "Pedro",
  last_name: "Matanzo",
  email: "pedro@pedro.com",
  address: "20 rue des capucins, Lyon",
  phone_number:"555-345-322",
  password: "secret"
  )


user2 = User.create!(
  first_name: "Julie",
  last_name: "Jaumary",
  email: "julie@julie.com",
  address: "20 Rue de brest, Lyon",
  phone_number:"555-345-322",
  password: "secret")


user3 = User.create!(
  first_name: "Hugo",
  last_name: "Plé",
  email: "hugo@hugo.com",
  address: "Place Bellecour, Lyon",
  phone_number:"555-345-322",
  password: "secret")



user4 = User.create!(
  first_name: "David",
  last_name: "Habault",
  email: "david@david.com",
  address: "20 Rue Childebert, Lyon",
  phone_number:"555-345-322",
  password: "secret")

bar1 = Bar.create!(
  name: "Suberry",
  address: "17 Rue d'Inkermann, 69100 Villeurbanne ",

  )
bar2 = Bar.create!(
  name: "Barnadé",
  address: " 49 Rue de l’Abondance, 69003 Lyon",
  )

bar3 = Bar.create!(
  name: "Les Arpenteurs",
  address: "13 Rue Lanterne, 69001 Lyon",
  )

p '3 bars created'


p 'loading games from yml'
file_path = "lib/games.yml"
seed_file = File.join(file_path)
seeds = YAML::load_file(seed_file)
Game.create(seeds["games"])
p 'ok'

