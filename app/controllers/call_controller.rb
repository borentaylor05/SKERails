class CallController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token 

	def create
		if !User.exists?(jive_user_id: params[:jive_user_id])
			Rails.logger.info("CREATING USER")
			# create users on the fly
			@user = User.create(employee_id: params[:employee_id], jive_user_id: params[:jive_user_id], username: params[:username])
		else
			@user = User.find_by(jive_user_id: params[:jive_user_id])
		end
		if(!last_call.ended) # end previous call
			last_call.update_attributes(end_time: Time.now, ended: true)
		end
		# max call time set to 7 minutes
		# if post-call form is submitted within that time, end_time will be replaced
		current_call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+420, ended: false)  
		Rails.logger.info(current_call)
		respond_to do |format|
			format.html
			format.json { render json: current_call }	
		end
	end

	def end_call
		last_call.update_attributes(end_time: Time.now, ended: true)
		Rails.logger.info(Call.find(call_id).inspect)
	end


	private

		def last_call
			User.find_by(jive_user_id: params[:jive_user_id]).calls.last
		end

end
