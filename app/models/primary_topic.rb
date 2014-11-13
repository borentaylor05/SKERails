class PrimaryTopic < ActiveRecord::Base
	validates :name, presence: true
	has_many :secondary_topics
end
