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

  private

  def find_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:name, :description, :nb_player_max, :nb_player_min, :duration, :picture, :category)
  end
end
