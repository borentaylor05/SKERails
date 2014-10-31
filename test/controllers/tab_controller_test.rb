require 'test_helper'

class TabControllerTest < ActionController::TestCase
  
  def setup
  	@user = User.create(username: "Taylor", oracle_id: 1234567)
  end

  test "@tab should be invalid without click_attributes" do
  	tab = Tab.new(name: "Test Tab", tab_type: "MM")
  	assert_not tab.valid?, "#{tab.inspect} should not be valid"
  end

  test "Tab strong params" do
  	tab = Tab.new(name: "blah", tab_type: "junk")
  	assert_not tab.valid?, "#{tab.inspect} should not be valid"
  end

  

end
