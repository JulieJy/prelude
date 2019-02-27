class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :find_game, only: [:show]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
  end

  # search for a game with filters
  def search
    @games = Game.all
    @games.filter_nb_players
    @games.filter_duration
    @games.filter_style
  end

  # display 3 suggestions
  def suggestions
  end

  private

  def filter_nb_players
    Game.where(nb_player_min <= params[:players] <= nb_player_max)
  end
  def filter_duration
    Game.where(duration == params[:duration])
  end
  def filter_style
    Game.where(style == params[:style])
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :nb_player_max, :nb_player_min, :duration, :picture, :category)
  end
end
