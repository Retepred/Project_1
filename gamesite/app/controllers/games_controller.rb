class GamesController < ApplicationController

  load_and_authorize_resource

  def index
  end

  def update
    flash[:alert] = @game.errors.messages[:player].first if @game.errors.messages[:player]
    if @game.make_move(current_user, params[:square]).persisted?
      @game.reload
      if @game.ai_playing? && !@game.finished?
        @game.make_move( @game.player2, @game.free_squares.sample )
      end

      flash[:alert] = @game.errors.messages[:player].first if @game.errors.messages[:player]
      redirect_to(game_path(@game)) and return
    end
     redirect_to (game_path)
  end

    def show
    end

    def new
      @game = Game.new
    end

    def create
      @game.player1 = current_user

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
    params.require(:game).permit(:game_name, :player1_id, :player2_id, :username)
  end

end