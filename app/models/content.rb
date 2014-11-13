class Content < ActiveRecord::Base
	belongs_to :subtopic
	validates :name, presence: true
	validates :link, presence: true
	validates :native, presence: true
	validates :subtopic_id, presence: true
end
