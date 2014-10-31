class CallIntegrationTest < ActionDispatch::IntegrationTest

def setup
	@host = "http://localhost:3000"
end

test "posting to tab" do 
	post_via_redirect("#{setup}/calls", {start_time: Time.now, end_time: Time.now+10*60})
	assert_response :success
end	

end