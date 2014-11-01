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
		if(session[:current_call].present?) # end previous call
			Call.find(session[:current_call][:val]).end_time = Time.now
			session.delete :current_call
		end
		session[:current_call] = { :value => current_call.id, :expires => Time.now + 3600}
		Rails.logger.info(session[:current_call].inspect)
		respond_to do |format|
			format.html
			format.json { render json: current_call }	
		end
	end

	def end_call
		Rails.logger.info(session.class.inspect)
		if session.present?
			Rails.logger.info("CALL:  "+session[:current_call].inspect)
			Call.find(session[:current_call][:value]).end_time = Time.now
			session.delete :current_call
			Rails.logger("CALL ENDED")
		else
			Rails.logger.info("SESSION NOT SET")
		end
	end

end
