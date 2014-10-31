class Click < ActiveRecord::Base
	belongs_to :action, polymorphic: true
	validates :action, presence: true
end
