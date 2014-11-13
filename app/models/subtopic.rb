class Subtopic < ActiveRecord::Base
	validates :secondary_topic_id, presence: true
	validates :name, presence: true
	has_many :contents
	belongs_to :secondary_topic

end
