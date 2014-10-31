require 'test_helper'

class TabControllerTest < ActionController::TestCase
  
  test "access to tab controller" do 
  	get :create
  	assert_response :success
  end

end
