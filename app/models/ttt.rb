class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :player_one_id, class_name: 'User'
  belongs_to :player_two_id, class_name: 'User'

  @tttgrid = ["","","","","", "","","",""]
  @player_one_array = []
  
  #set the winning lines

  @w1 = [0, 1, 2]
  @w2 = [0, 3, 6]
  @w3 = [0, 4, 8]
  @w4 = [1, 4, 7]
  @w5 = [2, 5, 8]
  @w6 = [2, 4, 6]
  @w7 = [3, 4, 5]
  @w8 = [6, 7, 8]

  def self.winner
    @w1
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
 
end
