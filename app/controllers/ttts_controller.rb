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

    if (@w1 || @w2 || @w3 || @w4 || @w5 || @w6 || @w7 || @w8).include?()
    binding.pry
    redirect_to ttt_path
  end


end