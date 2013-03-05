class Player < ActiveRecord::Base
  attr_accessible :assists, :goals, :name, :player_id, :points, :position, :shutouts, :string, :wins

  has_many :picks
  has_many :teams, through: :picks
  
  validates :player_id, uniqueness: true, scope: [:league_id]
end
