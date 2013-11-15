class OrganizationsController < ApplicationController

	# GET /organizations
	# GET /organizations.json	
	def index
	    @organizations = Organization.all

	    respond_to do |format|
	      format.html # index.html.erb
	      format.json { render json: @organizations }
	    end
  	end

	def new
	    @organization = Organization.new

	    respond_to do |format|
	      format.html # new.html.erb
	      format.json { render json: @organization }
	    end
	end

	def show
	  	@organization = Organization.find(params[:id])

		respond_to do |format|
	      format.html # show.html.erb
	      format.xml  { render xml: @organization }
	      format.json { render json: @organization }
		end
	end

	def create
		@organization = Organization.new(params[:organization])
		#logger.info("#{Time.now} create params[:organization] ##{params[:organization]}!")
		logger.debug "Create organization: #{@organization.attributes.inspect}"

		respond_to do |format|
			if @organization.save
				format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
				format.json { render json: @organization, status: :created, location: @organization }
			else
				format.html { render action: "new" }
				format.json { render json: @organization.errors, status: :unprocessable_entity }
			end
		end
	end

	# GET /campaigns/1/edit
	def edit
		@organization = Organization.find(params[:id])
		#@campaign.video_id ||= ""
	end	


	# PUT /businesses/1
	# PUT /businesses/1.json
	def update
	    @organization = Organization.find(params[:id])

		respond_to do |format|
			if @organization.update_attributes(params[:organization])
				format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: "edit" }
				format.json { render json: @organization.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /businesses/1
	# DELETE /businesses/1.json
	def destroy
		@organization = Organization.find(params[:id])

		@organization.destroy

		respond_to do |format|
			format.html { redirect_to organizations_url }
			format.json { head :no_content }
		end
	end
end
