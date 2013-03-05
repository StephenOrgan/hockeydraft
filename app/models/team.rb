class Team < ActiveRecord::Base
  attr_accessible :integer, :name, :team_id

  has_many :players
  belongs_to :league
  has_one :user

end
