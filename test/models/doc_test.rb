require 'test_helper'

class DocTest < ActiveSupport::TestCase
  def setup
	  @user = User.create(username: "Taylor", employee_id: 1234567, jive_user_id: 1)
    @call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+60, ended: false)
  	@doc = Doc.new(title: "Test Title", doc_num: "DOC-0000")
  end

  test "Doc should be invalid without click" do 
  	assert_not @doc.valid?, "#{@doc.inspect} should be invalid"
  end

  test "Doc should be valid with Click" do 
  	click = Click.create(user_id: @user.id, action: @doc, call_id: @call.id)
  	@doc.click = click
  	assert @doc.valid?, "#{@doc.inspect} should be valid"
  end
end
