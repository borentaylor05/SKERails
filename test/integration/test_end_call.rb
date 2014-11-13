class TestEndCall < ActionDispatch::IntegrationTest

def setup
	@host = "http://localhost:3000"
end

test "posting to tab" do 
	post_via_redirect("#{setup}/end-call", { jive_user_id: 1 })
	assert_response :success
end	

end