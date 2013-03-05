class User < ActiveRecord::Base
  attr_accessible :email, :user_id, :username

  has_many :teams
  has_many :players, through: :teams
  has_many :picks
  # has_many :leagues, through: :teams

end
