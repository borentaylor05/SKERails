class Subtopic < ActiveRecord::Base
	validates :secondary_topic_id, presence: true
	validates :name, presence: true
end
