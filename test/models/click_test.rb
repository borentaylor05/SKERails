require 'test_helper'

class ClickTest < ActiveSupport::TestCase

	def setup
		@user = User.create(username: "Taylor", employee_id: 1234567, jive_user_id: 1)
    @call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+60, ended: false)
    @click = Click.new(user_id: @user.id, call_id: @call.id)
	end
  
  test "Click should not be created without action (Tab, Search or Doc)" do 
  	assert_not @click.valid?, "#{@click.inspect} should be invalid"
  end

  test "Click should be valid and type Tab" do 
  	tab = Tab.create(name: "Test Tab", tab_type: "MM")
  	@click.action = tab
  	assert @click.valid?, "#{@click.inspect} should be valid"
  	assert @click.action_type == "Tab"
  end

  test "Click should be valid and type Doc" do 
  	doc = Doc.create(title: "Test Doc 1", doc_num: "DOC-0000")
  	@click.action = doc
  	assert @click.valid?, "#{@click.inspect} should be valid"
  	assert @click.action_type == "Doc"
  end

  test "Click should be valid and type Search" do 
  	search = Search.create(subject: "Test Search subject")
  	@click.action = search
  	assert @click.valid?, "#{@click.inspect} should be valid"
  	assert @click.action_type == "Search"
  end


end
