class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  def create
    @game = Ttt.create
    @game.user_id = current_user.id
    # @game.player_two_id = params sfgsfg

    if @game.save
      redirect_to ttt_path(ttt)
    else
      render 'new'
    end
    
  end

  def show
    @game = Ttt.find(params[:id])
    @showgrid = Ttt.split_grid
  end

  def update
    @player_one_array = []
    Ttt.show_grid[params[:index].to_i] = 'x'
    Ttt.player_moves << params[:index].to_i

    if Ttt.winner.include?(Ttt.player_moves.sort)
      render partial: 'winpage'  
    else
      redirect_to ttt_path
    end
  end


end