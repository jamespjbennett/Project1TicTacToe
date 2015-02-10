class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :user

  @tttgrid = ["","","","","", "","","",""]
  @player_one_array = []
  @count = 1
  @player_one = 'X'
  @player_two = '0'
  
  #set the winning lines

  def self.winner
    [
      [0, 1, 2],
      [0, 3, 6],
      [0, 4, 8],
      [1, 4, 7],
      [2, 5, 8],
      [2, 4, 6],
      [3, 4, 5],
      [6, 7, 8]
    ]
  end
   
  def self.show_grid
    @tttgrid
  end 


  def self.split_grid
      @tttgrid.each do |grid|
        grid
      end
  end


  def self.player_moves
    @player_one_array
  end

  def self.reset_grid
    @tttgrid = ["","","","","", "","","",""]
    @player_one_array = []
  end

  def self.next_player
    if @count % 2 != 0
      @count += 1
      @player_one
    else
      @count += 1
      @player_two
    end
  end
 
end
