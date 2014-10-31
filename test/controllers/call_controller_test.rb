require 'test_helper'

class CallControllerTest < ActionController::TestCase
  test "end call route" do 
  	get :end_call
  end
end
