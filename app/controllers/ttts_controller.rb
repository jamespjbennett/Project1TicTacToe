class TttsController < ApplicationController

  def new
    @newgame = Ttt.new 
  end

  def show
    @showgrid = Ttt.split_grid
  end


end