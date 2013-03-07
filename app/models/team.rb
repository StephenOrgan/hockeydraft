class Team < ActiveRecord::Base
  attr_accessible :integer, :name, :team_id, :league_id

  has_many :players
  belongs_to :league
  has_one :user

  validates :name, presence: true
  validates :league_id, presence: true
end
