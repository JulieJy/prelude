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
  def search_games
    # Start : all games
    @games = Game.all
    # Step 1 : filter by nb of players
    # games1 = games.filter_nb_players(params[:nb_player].to_i)

    @games_search_result = retrieve_data_between_two_values(params[:nb_player].to_i)

    # @games = Game.where(params[:nb_player].to_i BETWEEN nb_player_min AND nb_player_max)
    # raise
    # Step 2 : filter by duration
    # games2 = games1.filter_duration(params[:duration].to_i)
    # Step 3 (final): filter by style
    # @games_search_result = games2.filter_style(params[:category])
    redirect_to games_search_suggestions_path(@games_search_result)
  end

  # display 3 suggestions (random)
  def suggestions
    @games = Game.all
    @games_search_result = retrieve_data_between_two_values(params[:nb_player].to_i)
    if @games_search_result.nil?
      return
    else
      @games = @games_search_result.sample(3)
    end
  end

  private

  def filter_nb_players(nb)
    Game.where(nb BETWEEN nb_player_min AND nb_player_max)
  end

  def retrieve_data_between_two_values(user_params)
    Game.where("nb_player_min <= ? AND nb_player_max >= ?", user_params, user_params)
  end

  def filter_duration(drtion)
    Game.where(drtion == duration)
  end

  def filter_style(style)
    Game.where(style == category)
  end

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :nb_player_max, :nb_player_min, :duration, :picture, :category)
  end
end
