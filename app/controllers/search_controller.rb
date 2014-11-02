require 'json'

class SearchController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token  

	def create
		user = User.find_by(jive_user_id: params[:jive_user_id])
		if params_present? and !user.calls.last.ended
			Rails.logger.info(params);
			call = user.calls.last
			search = Search.new(subject: params[:subject])
			click = Click.new(user_id: user.id, action: search, call_id: call.id)
			search.click = click
			if search.valid?
				search.save
			else
				Rails.logger.info(search.errors.full_messages)
			end
			if click.valid?
				click.save
			else
				Rails.logger.info(click.errors.full_messages)
			end
			Rails.logger.info(search.inspect)
			Rails.logger.info(click.inspect)
			data = { search: search, click: click }
		else
			if !params_present?
				data = { error: "The required params are not present: Jive ID or subject." }
			else
				data = { error: "User not in active call." }
			end

		end
		respond_to do |format|
			format.html 
			format.json {render json: data}
		end
	end

	def params_present?
		if params.has_key?(:jive_user_id) and params.has_key?(:subject)
			return true
		else
			return false
		end
	end

end
