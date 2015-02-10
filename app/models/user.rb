class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :moves
  has_many :ttts
  # has_many :ttts_as_player_one, foreign_key: 'player_one_id', class_name: 'Ttt'
  # has_many :ttts_as_player_two, foreign_key: 'player_two_id', class_name: 'Ttt'

end
