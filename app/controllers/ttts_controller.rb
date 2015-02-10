class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  def show
    @game = Ttt.find(params[:id])
    @showgrid = Ttt.split_grid
  end

  def update
    @player_one_array = []
    Ttt.show_grid[params[:index].to_i] = 'x'
    Ttt.player_moves << params[:index].to_i
    binding.pry

    if Ttt.player_moves == Ttt.winner 
      redirect_to new_ttt_path  
    else
      redirect_to ttt_path
    end
  end


end