class User < ActiveRecord::Base

	validates :employee_id, presence: true, uniqueness: true #, length: { minimum: 7, maximum: 7 }
	validates :username, presence: true, uniqueness: true
	validates :jive_user_id, presence: true, uniqueness: true
	has_many :calls
	has_many :clicks
end
