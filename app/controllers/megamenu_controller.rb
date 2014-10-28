class MegamenuController < ApplicationController
	def click
		respond_to do |format|
			format.html 
			format.json {render json: params}
		end
	end
end
