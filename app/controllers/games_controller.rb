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

  # display search form
  def search
  end

  # search for a game with filters
  def suggestions
    @games = filters(params[:nb_player].to_i, params[:duration].to_i, params[:category].capitalize)
    if @games.nil?
      return
    elsif @games.size > 3
      @games = @games.sample(3)
    else
      @games = @games
    end
  end

  private

  def filters(user_players, user_duration, user_category)
    Game.where("nb_player_min <= ? AND nb_player_max >= ?", user_players, user_players).where("duration = ?", user_duration).where("category = ?", user_category)
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :nb_player_max, :nb_player_min, :duration, :picture, :category)
  end
end
