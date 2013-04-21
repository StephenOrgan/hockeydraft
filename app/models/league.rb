class League < ActiveRecord::Base
  attr_accessible :name, :commissioner_id, :user_id, :status, :lr_forwards, :lr_defensemen, :lr_goalies, :season
  has_many :teams
  has_many :picks
  has_many :players, :through => :picks
	belongs_to :user
  belongs_to :commissioner, class_name: 'User'

  validates :name, presence: true


	state_machine :status, initial: :not_started do
		after_transition any => :draft_started, :do => :assign_draft_order

		event :start_draft do
			transition :not_started => :draft_started
		end
<<<<<<< HEAD

		event :end_draft do
	 		transition :draft_started => :draft_completed
		end
=======
			event :end_draft do
			transition :draft_started => :draft_completed
		end

>>>>>>> 62e75a324a04e00e30a51230deab0118588f897b
	end

	def assign_draft_order
		Rails.logger.debug "\n>> assign_draft_order\n"
		Rails.logger.debug "\nteams.empty? #{teams.empty?}\n"
		return if teams.empty?

		teams.each { |n| n.update_attribute(:draftrank, 0) }

		i = 1
		teams.order("RANDOM()").each do |team|
			team.update_attributes(:draftrank => i, :direction => 'down') 
			i = i + 1
		end
		t = teams.where(:draftrank => 1)
		t.first.update_attributes(:status => 'ready_to_pick')
	end

end

#until i == Team.count(:conditions => ["league_id = ?", league.id]) + 1
#teams.update_all draftrank: 0
#teams = Team.where(:league_id => league.id)
