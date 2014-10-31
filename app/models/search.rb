class Search < ActiveRecord::Base
	has_one :click, as: :action
	accepts_nested_attributes_for :click
end
