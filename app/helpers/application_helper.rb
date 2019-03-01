module ApplicationHelper
  def time_for(game)
    case @game.duration
      when "fast"
        "rapide (- de 35min)"
      when "medium"
        "moyen (entre 35min et 1h)"
      when "long"
        "long (+ de 1h)"
    end
  end
end
