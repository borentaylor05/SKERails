class CallIntegrationTest < ActionDispatch::IntegrationTest

def setup
	@host = "http://localhost:3000"
end

test "posting to call" do 
	post_via_redirect("#{setup}/calls", { employee_id: 1234567, jive_user_id: 1, username: "TEST" })
	assert_response :success
end	

end