class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :player_one_id, class_name: 'User'
  belongs_to :player_two_id, class_name: 'User'

  
  
  @player_one_sequence = []
  
  def self.add_number(x)
    @player_one_sequence << x
  end

end
