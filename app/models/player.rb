class Player < ActiveRecord::Base
  attr_accessible :assists, :goals, :name, :player_id, :points, :position, :shutouts, :string, :wins, :team, :gwg, :gp, :losses, :ot

  
  #has_many :users, through: :picks
  has_many :picks
  has_many :teams, through: :picks
  
  validates :player_id, uniqueness: true


     

  def taken_for?(league_id)
		  picks.find do |p| 
    	p.league_id == league_id
    end
  end

  def forward?
      if position =='C'
        true
      elsif position =='L'
        true
      elsif position == 'R'
        true
      else 
        false
      end
  end


  def defense?
      if position == 'D'
        true
      else
        false
      end
  end


  def goalie?
      if position == 'G'
        true
      else
        false
      end
  end

      def notexceed_defense?(league, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultdefense = result["D"]  

          if position == 'D'
            if league.lr_defensemen > resultdefense
              true
            else
              false
            end
          end
      end

      def notexceed_forward?(league, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultforward = result["C"] + result["L"] + result["R"]            

          if position == 'C' || position =='L' || position =='R'
            if league.lr_forwards > resultforward
            true
          else
            false
            end
          end
      end

      def notexceed_goalie?(league, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultgoalie = result["G"]  

          if position == 'G'
            if league.lr_goalies > resultgoalie
              true
            else
              false
            end
          end
      end


end
