class PropertiesController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :create, :new]
	before_action :find_property, only: [:show, :edit, :update, :destroy]

	def index
		user_id = User.find(current_user)
		@properties = user_id.properties
		#.order("created_at ASC")
	end

	def show
		if @property.user_id == current_user.id
			
		else
			redirect_to root_path, :notice => "You dont have access to this property."
		end
	end

	def new
		@property = Property.new
	end

	def create
		@property = Property.new(property_params)
		@property.user_id = current_user.id
		if @property.save
			redirect_to @property
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @property.update(property_params)
			redirect_to @property
		else
			render "edit"
		end
	end

	def destroy
		@property.destroy
		redirect_to @property
	end

	private

	def property_params
		params.require(:property).permit(:address_one, :address_two, :city, :state, :zip_code, :rent)
	end

	def find_property
		@property = Property.find(params[:id])
	end

	def signed_in_user
	    unless signed_in?
	        redirect_to root_path, :notice => "You must be logged in to view your properties."
    	end
    end
end