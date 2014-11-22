class ContentController < ApplicationController

	# Line below avoids need for csrf token verification.  Leaving this out will
	# cause the Rails app to reject any POST request from external sites
	# with Error: 422, Unprocessable_Entity
	skip_before_action :verify_authenticity_token  


	def get_wwc_content
		contents = Hash[]
		Content.all.each do |c|
			parts = c.link.split("?")[0].split("/")
			doc = parts[parts.length - 1]
			contents[c.name] = doc
		end
		respond_to do |format|
			format.any(:json, :html) { render json: contents }
		end
	end

	def wwc_add_to_favorites
		if !params.has_key?(:jive_user_id) or !params.has_key?(:doc_num) 
			return "Must contain Jive ID and Document number"
		end
		if User.find_by(jive_user_id: params[:jive_user_id]).blank?
			user = User.new(jive_user_id: params[:jive_user_id], client_id: params[:client_id])
			if user.valid?
				user.save
			else
				Rails.logger.info(user.errors.full_messages)
			end
		else
			user = User.find_by(jive_user_id: params[:jive_user_id])
		end


	end

	def show
		if params.has_key?(:doc)
			doc = Content.find_by(doc_num: params[:doc])
		else
			doc = Content.find(params[:id])
		end
		if !doc.blank?
			parents = "#{doc.subtopic.secondary_topic.primary_topic.name} > #{doc.subtopic.secondary_topic.name} > #{doc.subtopic.name}"
			doc = to_hash(doc)
			doc['parent'] = parents
		else
			Rails.logger.info("Doc is blank!!!")
		end
		respond_to do |format|
			format.any(:json, :html) { render json: doc }
		end
	end
	
	def get_structure
		NewRelic::Agent.add_custom_parameters({ 
			secondary_topic: SecondaryTopic.find(params[:secondary]).name,
			primary_topic: SecondaryTopic.find(params[:secondary]).primary_topic
			})
		respond_to do |format|
			format.html
			format.json { render json: get_struct(params[:secondary]) }
		end
	end

	def get_doc_dropdown
		dropdown = []
		if params.has_key?(:primary)
			SecondaryTopic.where(primary_topic_id: params[:primary]).each do |s|
				st = { id: s.id, name: s.name }
				dropdown.push(st)
			end
		elsif params.has_key?(:secondary)
			Subtopic.where(secondary_topic_id: params[:secondary]).each do |s|
				sub = { id: s.id, name: s.name }
				dropdown.push(sub)
			end
		end
		respond_to do |format|
			format.json { render json: dropdown }
		end
	end

	def new_content
		native = to_boolean(params[:native])
		doc = Content.new(name: params[:name], link: params[:link], subtopic_id: params[:subtopic_id], native: native)
		if params.has_key?(:summary)
			doc.summary = params[:summary]
		end
		if params.has_key?(:original_doc)
			doc.original_doc = params[:original_doc]
		end
		if doc.valid?
			doc.save
			response = { status: "1", message: "Document inserted successfully!" }
		else
			response = { status: "0", message: doc.errors.full_messages }
		end

		respond_to do |format|
			format.json{ render json: response }
		end
	end

	private

		def get_struct(sec)
			subtopics = []
			sub = {}
			Subtopic.where(secondary_topic_id: sec).order(id: :asc).each do |s|
				sub = {  name: s.name, docs: [] }
				Content.where(subtopic_id: s.id).order(id: :asc).each do |c|
					doc = { name: c.name, link: c.link, native: c.native, original_doc: c.original_doc, summary: c.summary }
					sub[:docs].push(doc)
				end
				if !sub.blank? and !sub[:docs].blank?
					subtopics.push(sub)
				end
			end
			return subtopics
		end


		def to_hash(content)
		    hash = {}; 
		    content.attributes.each { |k,v| hash[k] = v }
		    return hash
		end
end
