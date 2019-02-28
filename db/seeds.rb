# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'destroying all games'
Game.destroy_all

p 'creating 1 game'
Game.create!(
  name: "7 WONDERS",
  nb_player_min: 2,
  nb_player_max: 7,
  duration: 30,
  description: "7 Wonders est un jeu de carte aux règles riches mais simples, facile à mettre en place pour des parties rapides et rythmées.
Pour commencer la partie, chacun des 2 à 7 joueurs prend la tête d’une ville mythique (Babylone, Éphèse, Rhodes…), et va disposer de trois Âges pour la faire prospérer et même bâtir la légendaire Merveille du monde qui y est associée. Au début d’un Âge, chaque joueur reçoit une main de 7 cartes dans laquelle il va choisir, en même temps que les autres, celle qu’il va jouer. Chaque carte peut être jouée de trois façons : face visible, en payant son coût pour l’intégrer à sa zone de jeu et bénéficier de ses effets ; face cachée sous son plateau, en payant le coût de l’étage de la merveille qui va également lui apporter avantages et/ou points de victoire ; ou bien encore en la défaussant pour gagner 3 pièces d'or et renflouer son trésor.
Les cartes appartiennent à 6 grandes familles qui vont permettre aux joueurs de développer leurs ressources, de combattre, de commercer, et de favoriser les sciences ou les arts. Une fois les cartes jouées, chaque joueur passe ses cartes restantes à son voisin (de droite ou de gauche, selon l’Âge en cours) pour en sélectionner une nouvelle, et ainsi de suite jusqu’à ce qu’il ne lui reste deux cartes en main. Après avoir joué l’avant dernière carte et défaussé la dernière, l’Âge en cours prend fin et les joueurs résolvent les conflits militaires avec leurs voisins avant de passer à l’Âge suivant.
À l’issue du 3ème et dernier Âge, le joueur totalisant le plus de points de victoire remporte la partie.",
  picture: "https://www.espritjeu.com/upload/image/7-wonders-p-image-65500-grande.jpg",
  category: "Stratégie"
  )

game1 = Game.create!(

  name:"Les aventuriers du rail",
  nb_player_min: 2,
  nb_player_max: 5,
  description: "Les Aventuriers du Rail - Europe  est le deuxième volume de la célèbre série des Aventuriers du Rail dont la version de base se joue sur une carte des USA. Plus qu'une nouvelle carte, cette version incorpore de nouvelles routes (tunnels et ferries), et de nouvelles pièces de jeu, les gares.",
  picture: "https://www.espritjeu.com/upload/image/les-aventuriers-du-rail---europe-p-image-59803-grande.jpg",
  duration: 30,
  category: "Stratégie"
)

game4 = Game.create!(
  name:"Tu te mets combien ?",
  nb_player_min: 2,
  nb_player_max: 10,
  description: "Évalue tes connaissances de 1 à 10 et réponds aux questions !",
  picture: "https://cdn3.philibertnet.com/419835-large_default/ttmc-tu-te-mets-combien-.jpg",
  duration: 90,
  category: "Ambiance"
  )
p '3 games created'

p 'I destroy all users'
User.destroy_all


p 'I create 2 users'
user1 = User.create!(
  first_name: "Pedro",
  last_name: "Matanzo",
  email: "pedro@pedro.com",
  address: "Madrid",
  phone_number:"555-345-322",
  password: "secret"
  )


user2 = User.create!(
  first_name: "Julie",
  last_name: "Jaumary",
  email: "julie@julie.com",
  address: "20 rue des capucins, Lyon",
  phone_number:"555-345-322",
  password: "secret")


user3 = User.create!(
  first_name: "Hugo",
  last_name: "Plé",
  email: "hugo@hugo.com",
  address: "20 rue des capucins, Lyon",
  phone_number:"555-345-322",
  password: "secret")



user4 = User.create!(
  first_name: "David",
  last_name: "Habault",
  email: "david@david.com",
  address: "20 rue des capucins, Lyon",
  phone_number:"555-345-322",
  password: "secret")
