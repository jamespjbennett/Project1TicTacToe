class TttsController < ApplicationController

  def new
    @game = Ttt.new 
  end

  def create
    @game = Ttt.create(ttt_params)
    @game.user current_user

    if @game.save
      redirect_to ttt_path(@game)
    else
      render 'new'
    end
    
  end

  def show
    @game = Ttt.find(params[:id])
    @game.user = current_user
    @showgrid = Ttt.split_grid
  end

  def update

    @player_value = Ttt.show_grid[params[:index].to_i] = Ttt.next_player

    case 
      when (@player_value == 'X') && (Ttt.last.computer == 1)
        Ttt.player_one_moves << params[:index].to_i
        Ttt.computer_choice unless Ttt.computer_final_count <= 1
      when (@player_value == 'X') && (Ttt.last.computer == nil)
        Ttt.player_one_moves << params[:index].to_i
      when (@player_value == '0') && (Ttt.last.computer == nil)
        Ttt.player_two_moves << params[:index].to_i   
    end
   
    case
      when (Ttt.winner & Ttt.player_one_moves.sort.combination(3).to_a).count == 1
        user = current_user
        user.wins.nil? ? user.wins = 1 : user.wins += 1
        user.save
        Ttt.reset_all
        render partial: 'winpage'  
      when (Ttt.winner & Ttt.player_two_moves.sort.combination(3).to_a).count == 1
        user = current_user
        user.losses.nil? ? user.losses = 1 : user.losses += 1
        user.save
        Ttt.reset_all
        render partial: 'losepage'
      when Ttt.show_grid.exclude?("")
        user = current_user
        user.draws.nil? ? user.draws = 1 : user.draws += 1
        user.save
        Ttt.reset_all
        render partial: 'drawpage'
      when (Ttt.winner & Ttt.computer_moves.sort.combination(3).to_a).count == 1
        user = current_user
        user.losses.nil? ? user.losses = 1 : user.losses += 1
        user.save
        Ttt.reset_all
        render partial: 'losepage'
      else
      redirect_to ttt_path
    end
  end

  private
  def ttt_params
    params.require(:ttt).permit(:computer )
  end


end