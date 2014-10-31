class TabController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token  

	def create
		@tab = 
		respond_to do |format|
			format.html 
			format.json {render json: params}
		end
	end

	def click_params
		params.require(:tab).permit(:name, :type, click_attributes: [:id, :user_id])
	end

end
