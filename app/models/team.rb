class Team < ActiveRecord::Base
  attr_accessible :integer, :direction, :name, :team_id, :league_id, :user_id, :draftrank, :status

  #has_many :players through: :picks
  has_many :picks
  belongs_to :league
  has_one :user
  has_many :players, :through => :picks

  validates :name, presence: true
  validates :league, presence: true

	# def owner_of?(team_id)
	 #  team.find do |t| 
   #	t.user_id == current_user.id
   	# end
  # end

end
