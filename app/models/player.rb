class Player < ActiveRecord::Base
  attr_accessible :assists, :goals, :name, :player_id, :points, :position, :shutouts, :string, :wins, :team, :gwg, :gp

  
  #has_many :users, through: :picks
  has_many :picks
  has_many :teams, through: :picks
  
  validates :player_id, uniqueness: true

  def taken_for?(league_id)
		picks.find do |p| 
    	p.league_id == league_id
   	end
  end

end
