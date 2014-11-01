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
		# max call time set to 7 minutes
		# if post-call form is submitted within that time, end_time will be replaced
		current_call = Call.create(user_id: @user.id, start_time: Time.now, end_time: Time.now+420)  
		Rails.logger.info(current_call)
		if(params[:call_id].to_i > 0) # end previous call
			Call.find(params[:call_id].to_i).update_attribute(:end_time, Time.now)
		end
		cookies[:current_call] = { :value => current_call.id, :expires => Time.now + 3600}
		Rails.logger.info(cookies[:current_call].inspect)
		respond_to do |format|
			format.html
			format.json { render json: current_call }	
		end
	end

	def end_call
		call_id = params[:call_id].to_i
		Call.find(call_id).update_attribute(:end_time, Time.now)
		Rails.logger.info(Call.find(call_id).inspect)
	end

end
