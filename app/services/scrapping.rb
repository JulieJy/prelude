class Scrapper
# On récupère tous les liens des jeux de stratégie (11)
  def self.fetch_urls(url)
    # strategy_url = "https://www.espritjeu.com/jeux-de-strategie.html#filtres=25"
    headers = {
      "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
      "Accept-Encoding": "gzip, deflate, br",
      "Accept-Language": "fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7",
      "Cache-Control": "max-age=0",
      "Connection": "keep-alive",
      "Cookie": "PHPSESSID=2ikijqmnv3mk00c59h7u184a33; _gcl_au=1.1.892566092.1550566149; _ga=GA1.2.1699820971.1550566149; acces_admin=false; _gid=GA1.2.1350096614.1551359219; df-search-b0d903cedd7620be0e9468e01bbb930d={%22session_id%22:%2221ec1a4f50d4ffc55c1dc87ce37664a7%22%2C%22registered%22:true%2C%22query%22:%22incontournable%20ambiance%22}; visite=db9664e9f7fd60e789fb4c7bb0abbfab",
      "Host": "www.espritjeu.com",
      "Upgrade-Insecure-Requests": "1",
      "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"
    }
    response = RestClient.get(url, headers)
    doc = Nokogiri::HTML(response.body)
    games = doc.search(".bp_designation a")
    games.take(10).map do |game|
      uri = URI.parse(game.attributes["href"].value)
      uri.scheme = "http"
      uri.host = "www.espritjeu.com"
      uri.query = nil
      uri.to_s
    end
  end

  # On itère sur chaque lien pour  récup les infos

  def self.scrape_game(url, category)
    doc = Nokogiri::HTML(open(url, "Accept-Language" => "fr").read)
    name = doc.search(".fa_designation").text
    # image = doc.search('.light').attr('src')
    image = doc.xpath("//img[@src]")
    # image = doc.search(".light")
    nb_player = doc.search(".fa_joueurs").text
    duration = doc.search(".fa_duree").text
    if duration.split.include?("Environ")
      duration_moy = duration.split[1].to_i
    elsif duration.split.include?("heures")
      duration_moy = (duration.split[0].to_i + duration.split[2].to_i)/2*60
    elsif duration.split.include?("minutes")
      duration_moy = (duration.split[0].to_i + duration.split[2].to_i)/2
    end
    description = doc.search(".cont-onglet p").text
    nb_player_min = nb_player.split("à")[0].to_i
    nb_player_max = nb_player.split("à")[1].to_i
    p name

    # game = Game.new(
    #   name: name,
    #   nb_player_min: nb_player_min,
    #   nb_player_max: nb_player_max.nil? ? nb_player_min : nb_player_max,
    #   duration: if duration_moy <= 20
    #               "fast"
    #             elsif duration_moy <= 45
    #               "medium"
    #             else
    #               "long"
    #             end,
    #   description: description.blank? ? "Erreur, ce jeu n'a pas de description :(" : description,
    #   category: category
    #   )
    # cloudinary
    game.remote_picture_url = image[2].attributes["src"].value
    # p game.name
    # p game.duration
    # p duration_moy
    # p game.duration
    # p game.save!
  end

  p "Fetching urls"
  p " ------------------------------- "
end

      # duration: (if duration.to_i <= 35
      #             "fast"
      #           elsif duration.to_i <= 65
      #             "medium"
      #           else
      #             "long"
      #           end),
