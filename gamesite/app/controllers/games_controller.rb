class GamesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def update
    @game.make_move(current_user, params[:square])
    redirect_to(game_path(@game))
  end

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @game.save
        flash[:notice] = "Game #{@game.game_name} was successfully created."
        format.html { redirect_to(:action=>:index) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # def user_params
  #   params.require(:user).permit(:game_name)
  # end

  def game_params
    params.require(:game).permit(:game_name)
  end

end