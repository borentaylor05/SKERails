require 'test_helper'

class MegamenuControllerTest < ActionController::TestCase

	def setup
		@user = User.new(username: "Taylor", oracle_id: "3170083");	
	end

  	test "megamenu access" do
  		get :click
  		assert_response :success
  		assert_select "footer"
  	end

  	

end
