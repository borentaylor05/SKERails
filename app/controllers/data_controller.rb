class DataController < ApplicationController

	def clicks_per_call
		num_calls = Call.count
		
	end

end
