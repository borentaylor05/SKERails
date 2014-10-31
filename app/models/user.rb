class User < ActiveRecord::Base

	validates :oracle_id, presence: true, length: { minimum: 7, maximum: 7 }
	validates :username, presence: true

	has_many :calls
	has_many :clicks
end
