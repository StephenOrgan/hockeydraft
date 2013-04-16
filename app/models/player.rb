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

  def is_forward?(player)
      if player.position =='C'
        true
      elsif player.position =='L'
        true
      elsif player.position == 'R'
        true
      else 
        false
      end
  end


  def is_defense?(player)
      if player.position == 'D'
        true
      else
        false
      end
  end


  def is_goalie?(player)
      if player.position == 'G'
        true
      else
        false
      end
  end

      def exceeded_defense?(league, player, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultdefense = result["D"]  

          if player.position == 'D'
            if league.lr_defensemen > resultdefense
              true
            else
              false
            end
          end
      end

      def exceeded_forward?(league, player, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultforward = result["C"] + result["L"] + result["R"]            

          if player.position == 'C' || player.position =='L' || player.position =='R'
            if league.lr_forwards > resultforward
            true
          else
            false
            end
          end
      end

      def exceeded_goalie?(league, player, team)
          picks = Pick.where(:league_id => league.id, :team_id => team.id)
          result = picks.map {|pick| pick.player.position }.each_with_object(Hash.new(0)) {|each, result| result[each] += 1 }
          resultgoalie = result["G"]  

          if player.position == 'G'
            if league.lr_goalies > resultgoalie
              true
            else
              false
            end
          end
      end


end
