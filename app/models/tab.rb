class Tab < ActiveRecord::Base
	has_one :click, as: :action
	accepts_nested_attributes_for :click
end


# Tab.create(name: "Test", click_attributes: {user_id: 1})