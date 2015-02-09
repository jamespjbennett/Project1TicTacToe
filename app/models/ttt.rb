class Ttt < ActiveRecord::Base
  has_many :moves
  belongs_to :player_one_id, class_name: 'User'
  belongs_to :player_two_id, class_name: 'User'
end
