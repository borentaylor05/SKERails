require 'test_helper'

class CallTest < ActiveSupport::TestCase
  def setup
  	@user = User.create(username: "Taylor", oracle_id: 1234567)

  end

  test "call must have user" do 
  	call = Call.new(start_time: Time.now, end_time: Time.now)
  	assert_not call.valid?, "#{call.inspect} should not be valid"
  end

  test "call should be valid with user" do
  	call = Call.new(start_time: Time.now, end_time: Time.now, user_id: @user.id)
  	assert call.valid?, "#{call.inspect} should be valid"
  end
  
end
