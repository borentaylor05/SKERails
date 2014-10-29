class MegamenuController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token  
	def click
		respond_to do |format|
			format.html 
			format.json {render json: params}
		end
	end
end
