class TabIntegrationTest < ActionDispatch::IntegrationTest

def setup
	@host = "http://localhost:3000"
end

test "posting to tab" do 
	post_via_redirect("#{setup}/tabs", {name: "Test", tab_type: "MM"})
	assert_response :success
end	

end