class TestEndCall < ActionDispatch::IntegrationTest

def setup
	@host = "http://localhost:3000"
end

test "posting to tab" do 
	get_via_redirect("#{setup}/end-call")
	assert_response :success
end	

end