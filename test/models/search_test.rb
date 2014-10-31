require 'test_helper'

class SearchTest < ActiveSupport::TestCase
  def setup
	@user = User.create(username: "Taylor", employee_id: 1234567)
  	@search = Search.new(subject: "Test Subject")
  end

  test "Tab should be invalid without click" do 
  	assert_not @search.valid?, "#{@search.inspect} should be invalid"
  end

  test "Tab should be valid with Click" do 
  	click = Click.create(user_id: @user.id, action: @search)
  	@search.click = click
  	assert @search.valid?, "#{@search.inspect} should be valid"
  end
end
