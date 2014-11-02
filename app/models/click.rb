class Click < ActiveRecord::Base
	belongs_to :call
	belongs_to :user
	belongs_to :action, polymorphic: true
	validates :action, presence: true
	validates :call_id, presence: true
end
