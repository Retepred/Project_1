class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :moves
  has_many :games_as_player1, class_name: 'Game', foreign_key: :player1_id
  has_many :games_as_player2, class_name: 'Game', foreign_key: :player2_id

  def role?(role_to_compare) 
    self.role.to_s == role_to_compare.to_s 
  end

end
