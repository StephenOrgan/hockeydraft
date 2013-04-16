class League < ActiveRecord::Base
  attr_accessible :name, :commissioner_id, :user_id, :status, :lr_forwards, :lr_defensemen, :lr_goalies
  has_many :teams
  has_many :picks
  has_many :players, :through => :picks
	belongs_to :user
  belongs_to :commissioner, class_name: 'User'

  validates :name, presence: true

	before_save :assign_draft_order

	state_machine :status, initial: :not_started do
		after_transition any => :draft_started, :do => :assign_draft_order

		event :start_draft do
			transition :not_started => :draft_started
		end
	end

	def assign_draft_order
		if status == 'draft_started' 
			
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

end

#until i == Team.count(:conditions => ["league_id = ?", league.id]) + 1
#teams.update_all draftrank: 0
#teams = Team.where(:league_id => league.id)
