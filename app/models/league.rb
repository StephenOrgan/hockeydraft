class League < ActiveRecord::Base
  attr_accessible :name, :commissioner_id, :user_id
  has_many :teams

	belongs_to :user
  belongs_to :commissioner, class_name: 'User'

  validates :name, presence: true

end
