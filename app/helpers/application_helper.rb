module ApplicationHelper
  def time_for(game)
    case @game.duration
      when "fast"
        "rapide (- de 20 min)"
      when "medium"
        "moyen (entre 25 et 45 min)"
      when "long"
        "long (+ de 50 min)"
    end
  end

  def time_for2(game)
    case game.duration
      when "fast"
        "rapide (- de 20 min)"
      when "medium"
        "moyen (entre 25 et 45 min)"
      when "long"
        "long (+ de 50 min)"
    end
  end
end
