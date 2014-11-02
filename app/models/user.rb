class User < ActiveRecord::Base

	validates :employee_id, presence: true #, length: { minimum: 7, maximum: 7 }
	validates :username, presence: true
	validates :jive_user_id, presence: true
	has_many :calls
	has_many :clicks
end
