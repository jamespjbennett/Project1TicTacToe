class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :player_one_id, class_name: 'User'
  belongs_to :player_two_id, class_name: 'User'

  @tttgrid = ["","","","","", "","","",""]
  @player_one_array = []
   
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
