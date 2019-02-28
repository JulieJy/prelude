require 'open-uri'
require 'nokogiri'

class Scrapper
# On récupère tous les liens des jeux de stratégie (11)
  def self.fetch_strategy_urls
    strategy_url = "https://www.espritjeu.com/jeux-de-strategie.html#filtres=25"
    doc = Nokogiri::HTML(open(strategy_url).read)
    games = doc.search(".bp_designation a")
    games.take(5).map do |game|
      uri = URI.parse(game.attributes["href"].value)
      uri.scheme = "http"
      uri.host = "www.espritjeu.com"
      uri.query = nil
      uri.to_s
    end
  end

  # On itère sur chaque lien pour  récup les infos

  def self.scrape_game(url)
    doc = Nokogiri::HTML(open(url, "Accept-Language" => "fr").read)
    name = doc.search(".fa_designation").text
    # image = doc.search('.light').attr('src')
    image = doc.xpath("//img[@src]")
    # image = doc.search(".light")
    nb_player = doc.search(".fa_joueurs").text
    duration = doc.search(".fa_duree").text
    description = doc.search(".cont-onglet p").text


    nb_player_min = nb_player.split("à")[0].to_i
    nb_player_max = nb_player.split("à")[1].to_i
    game = Game.new(
      name: name,
      nb_player_min: nb_player_min,
      nb_player_max: nb_player_max.nil? ? nb_player_min : nb_player_max,
      duration: (if duration.to_i <= 40
                  "fast"
                elsif duration.to_i <= 65
                  "medium"
                else
                  "long"
                end),
      description: description,
      category: "Stratégie"
      )
    # cloudinary
    game.remote_picture_url = image[2].attributes["src"].value
    p game.save!
  end

  p "Fetching urls"
  p " ------------------------------- "
end
