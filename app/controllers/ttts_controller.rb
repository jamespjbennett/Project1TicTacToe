class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  def show
    @game = Ttt.find(params[:id])
    @showgrid = Ttt.split_grid
  end

  def update
    binding.pry
  end


end