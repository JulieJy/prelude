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

#Page 1
p 'scrapping 10 strategy games'
strategy_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=11&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=135&fltrsChoices%5B16%5D%5B%5D=25"
games = Scrapper.fetch_urls(strategy_url)
category = "Stratégie"
games.each {|url| Scrapper.scrape_game(url, category)}
p 'ok'

p 'scrapping 10 junior games'
junior_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=56&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=260&fltrsChoices%5B16%5D%5B%5D=25"
games = Scrapper.fetch_urls(junior_url)
category = "Junior"
games.each {|url| Scrapper.scrape_game(url, category)}
p 'ok'

p 'scrapping 10 apero games'
apero_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=41&categ_them_auto=&categorie_auto=&prixmin=2&prixmax=165&fltrsChoices%5B16%5D%5B%5D=25"
games = Scrapper.fetch_urls(apero_url)
category = "Ambiance"
games.each {|url| Scrapper.scrape_game(url, category)}
p 'ok'

#page 2
# p 'scrapping 10 strategy games - p2'
#strategy_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=11&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=135&fltrsChoices%5B16%5D%5B%5D=25"
#games = Scrapper.fetch_urls(strategy_url)
# category = "Stratégie"
# games.each {|url| Scrapper.scrape_game(url, category)}
# p 'ok'
#
# p 'scrapping 10 apero games'
# apero_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=41&categ_them_auto=&categorie_auto=&prixmin=2&prixmax=165&fltrsChoices%5B16%5D%5B%5D=25"
# games = Scrapper.fetch_urls(apero_url)
# category = "Ambiance"
# games.each {|url| Scrapper.scrape_game(url, category)}
# p 'ok'
