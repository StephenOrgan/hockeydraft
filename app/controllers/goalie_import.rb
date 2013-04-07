require 'csv'


class GoalieImport

	def import_player
		CSV.foreach('cache/20112012/goaliestats.csv') do |row|
		    record = Player.new(
		        :player_id => row[0], 
		        :name => row[2], 
		        :team => row[3], 
		        :gp => row[5],
		        :wins => row[6],
		        :losses => row[7],
		        :ot => row[8],
		        :shutouts => row[14],
		        :goals => row[15],
		        :assists => row[16]
		    )
		    record.save
		end
	 end

end
