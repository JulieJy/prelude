namespace :games do
    desc "scrapping to yml"
    task scrap_from_web: :environment do
      # Page 1 - 30 games
      p 'scrapping 30 strategy games'
      strategy_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=11&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=135&fltrsChoices%5B16%5D%5B%5D=25"
      games = Scrapper.fetch_urls(strategy_url)
      category = "Stratégie"
      games.each {|url| Scrapper.scrape_game(url, category)}
      p 'ok'

      p 'scrapping 30 apero games'
      apero_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=41&categ_them_auto=&categorie_auto=&prixmin=2&prixmax=165&fltrsChoices%5B16%5D%5B%5D=25"
      games = Scrapper.fetch_urls(apero_url)
      category = "Ambiance"
      games.each {|url| Scrapper.scrape_game(url, category)}
      p 'ok'

      p 'scrapping 30 junior games'
      junior_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=1&page[10001]=1&themTri%5B10001%5D=&categ_them=56&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=260&fltrsChoices%5B16%5D%5B%5D=25"
      games = Scrapper.fetch_urls(junior_url)
      category = "Junior"
      games.each {|url| Scrapper.scrape_game(url, category)}
      p 'ok'

      # page 2
      # 14 games
      p 'scrapping 14 strategy games (p2)'
      strategy_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=2&page[10001]=2&categ_them=11&categorie=11&categ_them_auto=11&themTri%5B10001%5D=&categ_them=11&categ_them_auto=&categorie_auto=&prixmin=5&prixmax=135&fltrsChoices%5B16%5D%5B%5D=25"
      games = Scrapper.fetch_urls(strategy_url)
      category = "Stratégie"
      games.each {|url| Scrapper.scrape_game(url, category)}
      p 'ok'

      # 17 games
      p 'scrapping 17 apero games (p2)'
      apero_url = "https://www.espritjeu.com/ajax/affichage_gabarit.ajax.php?idGabarit=10001&numPage=2&page[10001]=2&categ_them=41&categorie=41&categ_them_auto=41&themTri%5B10001%5D=&categ_them=41&categ_them_auto=&categorie_auto=&prixmin=2&prixmax=165&fltrsChoices%5B16%5D%5B%5D=25"
      games = Scrapper.fetch_urls(apero_url)
      category = "Ambiance"
      games.each {|url| Scrapper.scrape_game(url, category)}
      p 'ok'
    end
  end

  desc "BDD games to yml"
  task gamesyml: :environment do
    file_path = "lib/games.yml"
    ATTRIBUTES_TO_EXCLUDE = %w(id updated_at created_at)
    list = Game.all.each_with_object({}) do |game, hash|
     hash["-"] = game.attributes.reject { |attribute| ATTRIBUTES_TO_EXCLUDE.include?(attribute) }
    end
  end
end
