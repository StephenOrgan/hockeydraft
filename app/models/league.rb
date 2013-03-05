class League < ActiveRecord::Base
  attr_accessible :league_id, :name
  has_many :teams

  validates :name, {presence: true, :length => { :maximum => 140 }}
  validates :league_id, presence: true

end
