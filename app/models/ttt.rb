class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :user

  #define the variables which will be used within the class methods

  @tttgrid = ["","","","","", "","","",""]
  @player_one_array = []
  @player_two_array = []
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
  
  #take the grid array so it can manipulated in the update method

  def self.show_grid
    @tttgrid
  end 

  #split the grid array up so it's presented on the showpage

  def self.split_grid
      @tttgrid.each do |grid|
        grid
      end
  end

  #makes the player one and two array avaialable to add to so a winning combination can be matched.

  def self.player_one_moves
    @player_one_array
  end

  def self.player_two_moves
    @player_two_array
  end

  #after game is completed, this method resets the grid to original values

  def self.reset_grid
    @tttgrid = ["","","","","", "","","",""]
  end

  def self.reset_player_one_moves
    @player_one_array = []
  end

  def self.reset_player_two_moves
    @player_two_array = []
  end

  #selects the next player in the form of alternating X or 0 inputs based on the current count value
 
  def self.reset_counter
    @count = 1
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
