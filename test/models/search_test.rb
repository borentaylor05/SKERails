require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  def setup
	  @user = User.create(username: "Taylor", employee_id: 1234567, jive_user_id: 1)
    @call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+60, ended: false)
  	@search = Search.new(subject: "Test Subject")
  end

  test "Search should be invalid without click" do 
  	assert_not @search.valid?, "#{@search.inspect} should be invalid"
  end

  test "Search should be valid with Click" do 
  	click = Click.create(user_id: @user.id, action: @search, call_id: @call.id)
  	@search.click = click
  	assert @search.valid?, "#{@search.errors.full_messages} should be valid"
  end
end
