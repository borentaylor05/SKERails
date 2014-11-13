class ContentController < ApplicationController

	def get_structure
		respond_to do |format|
			format.html
			format.json { render json: params }
		end
	end

end
