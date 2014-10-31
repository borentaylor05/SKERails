require 'test_helper'

class DocTest < ActiveSupport::TestCase
  def setup
	@user = User.create(username: "Taylor", oracle_id: 1234567)
  	@doc = Doc.new(title: "Test Title", doc_num: "DOC-0000")
  end

  test "Tab should be invalid without click" do 
  	assert_not @doc.valid?, "#{@doc.inspect} should be invalid"
  end

  test "Tab should be valid with Click" do 
  	click = Click.create(user_id: @user.id, action: @doc)
  	@doc.click = click
  	assert @doc.valid?, "#{@doc.inspect} should be valid"
  end
end
