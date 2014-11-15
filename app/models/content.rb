class Content < ActiveRecord::Base
	belongs_to :subtopic
	validates :name, presence: true
	validates :link, presence: true
	validates :native, inclusion: [true, false]
	validates :subtopic_id, presence: true
end
