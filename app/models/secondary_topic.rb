class SecondaryTopic < ActiveRecord::Base
	validates :name, presence: true
	validates :primary_topic_id, presence: true
	belongs_to :primary_topic
	has_many :subtopics
end
