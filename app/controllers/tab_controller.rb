require 'json'

class TabController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token  

	def create
		if params_present?
			Rails.logger.info(params);
			user = User.find_by(jive_user_id: params[:jive_user_id])
			if !user.calls.last.ended
				call = user.calls.last
			end
			tab = Tab.new(name: params[:name], tab_type: params[:tab_type])
			click = Click.new(user_id: user.id, action: tab, call_id: call.id)
			tab.click = click
			if tab.valid?
				tab.save
			else
				Rails.logger.info(tab.errors.full_messages)
			end
			if click.valid?
				click.save
			else
				Rails.logger.info(click.errors.full_messages)
			end
			Rails.logger.info(tab.inspect)
			Rails.logger.info(click.inspect)
			data = { tab: tab, click: click }
			respond_to do |format|
				format.html 
				format.json {render json: data}
			end
		else
			"Required parameters were not sent!"
		end
	end

	def params_present?
		if params.has_key?(:jive_user_id) and params.has_key?(:name) and params.has_key?(:tab_type)
			return true
		else
			return false
		end
	end

end
