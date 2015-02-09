class TttsController < ApplicationController

  def new
      @newgame = Ttt.new 
  end

  def show
    @tttgrid = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""]
      ]

  end


end