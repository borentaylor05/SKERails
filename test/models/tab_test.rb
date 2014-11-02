require 'test_helper'

class TabTest < ActiveSupport::TestCase
  def setup
	  @user = User.create(username: "Taylor", employee_id: 1234567, jive_user_id: 1)
    @call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+60, ended: false)
  	@tab = Tab.new(name: "Test Tab", tab_type: "MM")
  end

  test "Tab should be invalid without click" do 
  	assert_not @tab.valid?, "#{@tab.inspect} should be invalid"
  end

  test "Tab should be valid with Click" do 
  	click = Click.create(user_id: @user.id, action: @tab, call_id: @call.id)
  	@tab.click = click
  	assert @tab.valid?, "#{@tab.inspect} should be valid"
  end

end
