class GamesController < ApplicationController
  before_action :set_game, except: [:index, :new, :create]
  load_and_authorize_resource

  def index
    @games = Game.all 
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path
    else
      render :new 
    end
  end

  def edit

  end

  def update
     @game.update(game_params)
     redirect_to games_path
  end

  def show
  end

  def destroy
    @game.destroy
    flash[:success] = "Game Destroyed"
    redirect_to games_path
  end

  private

  def set_game 
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:image, :title, :category, :active, :short_title, :image_file)
  end

end
