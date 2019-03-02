module ApplicationHelper
  def time_for(game)
    case @game.duration
      when "fast"
        "rapide (- de 20min)"
      when "medium"
        "moyen (entre 25 et 45min)"
      when "long"
        "long (+ de 50min)"
    end
  end
end
