require 'test_helper'

class DataControllerTest < ActionController::TestCase
  
  test "access to click / call data" do 
  	get :clicks_per_call
  	assert_response :success
  end

end
