class User < ActiveRecord::Base

	validates :jive_user_id, presence: true
	belongs_to :client
	has_many :calls
	has_many :clicks
end
