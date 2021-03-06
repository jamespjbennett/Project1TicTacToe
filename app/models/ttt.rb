class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :user

  class << self
    attr_accessor :status
  end

  #define the variables which will be used within the class methods

  @tttgrid = ["","","","","", "","","",""]
  @player_one_array = []
  @player_two_array = []
  @computer_array = []
  @count = 1
  @player_one = 'X'
  @player_two = '0'
  @computer = '0'
  @reset = false

  
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

  def self.computer_final_count
    remaining_values = self.show_grid.inject(Hash.new(0)) {|total, e| total[e] += 1; total}
    remaining_values[""]
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

  def self.computer_moves
    @computer_array
  end

  def self.computer_draw_logic
    @reset 
  end

  #after user has placed move v computer, the below method takes a random sample of all index values and

  def self.computer_choice
    number = [0, 1, 2, 3, 4, 5, 6, 7, 8].sample
    if @tttgrid[number] == ""
      @tttgrid[number] = "0"
      self.computer_moves << number
    else
      self.computer_choice
    end
  end

 

  #after game is completed, these set the reset methods so that

  def self.reset_grid
    @tttgrid = ["","","","","", "","","",""]
  end

  def self.reset_player_one_moves
    @player_one_array = []
  end

  def self.reset_player_two_moves
    @player_two_array = []
  end

  def self.reset_computer_moves
    @computer_array = []
  end

 
  def self.reset_counter
    @count = 1
  end

  def self.reset_all
    self.reset_grid
    self.reset_player_one_moves
    self.reset_player_two_moves
    self.reset_counter
    self.reset_computer_moves
  end

  #selects the next player in the form of alternating X or 0 inputs based on the current count value

  def self.next_player
    if Ttt.last.computer == nil
      if @count % 2 != 0
         @count += 1
         @player_one
      else
        @count += 1
        @player_two
      end
    else
      if @count % 2 != 0
         @player_one

      end    
    end
  end

end
