class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  def show
    @game = Ttt.find(params[:id])
    @showgrid = Ttt.split_grid
  end

  def update
    Ttt.show_grid.delete_at(params[:index].to_i)
    redirect_to ttt_path
  end


end