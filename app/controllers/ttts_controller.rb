class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  # def create
  #   @game = Ttt.create
  #   # @game.user_id = current_user.id
  #   # @game.player_two_id = params sfgsfg

  #   if @game.save
  #     redirect_to ttt_path(@game)
  #   else
  #     render 'new'
  #   end
    
  # end

  def show
    @game = Ttt.find(params[:id])
    @game.user = current_user
    @showgrid = Ttt.split_grid
  end

  def update

    @player_value = Ttt.show_grid[params[:index].to_i] = Ttt.next_player

      if @player_value == 'X'
        Ttt.player_one_moves << params[:index].to_i
      else
        Ttt.player_two_moves << params[:index].to_i
      end

      
    
      case
        when Ttt.winner.include?(Ttt.player_one_moves.sort)
          user = current_user
          user.wins.nil? ? user.wins = 1 : user.wins += 1
          user.save
          Ttt.reset_grid
          render partial: 'winpage'  
        when Ttt.winner.include?(Ttt.player_two_moves.sort)
          user = current_user
          user.losses.nil? ? user.losses = 1 : user.losses += 1
          user.save
          Ttt.reset_grid
          render partial: 'losepage'
        when Ttt.show_grid.exclude?("")
          user = current_user
          user.draws.nil? ? user.draws = 1 : user.draws += 1
          Ttt.reset_grid
          render partial: 'drawpage'
        else
        redirect_to ttt_path
      end
  end


end