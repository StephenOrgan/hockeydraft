require 'csv'


class PlayerImport

	def import_player
		CSV.foreach('cache/20112012/playerstats.csv') do |row|
		    record = Player.new(
		        :player_id => row[0], 
		        :name => row[2], 
		        :team => row[3], 
		        :position => row[4],
		        :gp => row[5],
		        :goals => row[6],
		        :assists => row[7],
		        :points => row[8],
		        :gwg => row[13]
		    )
		    record.save
		end
	 end

end