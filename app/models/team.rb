class Team < ActiveRecord::Base
  attr_accessible :integer, :direction, :name, :team_id, :league_id, :user_id, :draftrank, :status

  #has_many :players through: :picks
  has_many :picks
  belongs_to :league
  has_one :user
  has_many :players, :through => :picks

  validates :name, presence: true
  validates :league, presence: true

  after_save :after_team_created

  def after_team_created
    Pusher['private-'+ league.id.to_s].trigger('new_message', {:from => 'league_name', :subject => self.name + 'has joined ' + league.name})
  end

	# def owner_of?(team_id)
	 #  team.find do |t| 
   #	t.user_id == current_user.id
   	# end
  # end

end
