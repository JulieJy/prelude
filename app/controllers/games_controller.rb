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

  def search_games
    @games = Game.all
    @games.filter_nb_players
    @games.filter_duration
    @games.filter_style
  end

  def display_suggestions
  end

  private

    def filter_nb_players
      @games = Game.where(nb_player_min <= params[:players] <= nb_player_max)
    end
    def filter_duration
      @games = Game.where(duration == params[:duration])
    end
    def filter_style
      @games = Game.where(style == params[:style])
    end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :nb_player_max, :nb_player_min, :duration, :picture, :category)
  end
end
