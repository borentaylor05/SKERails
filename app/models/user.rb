class User < ActiveRecord::Base

	validates :jive_user_id, presence: true, uniqueness: true
	has_many :calls
	has_many :clicks
end
