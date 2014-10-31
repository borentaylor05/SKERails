class Doc < ActiveRecord::Base
	has_one :click, as: :action
	accepts_nested_attributes_for :click

	validates :click, presence: true
end
