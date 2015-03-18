class PropertiesController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :create, :new]
	before_action :find_property, only: [:show, :edit, :update, :destroy]
	helper_method :sort_column, :sort_direction, :sort_column2
	def index
		user_id = User.find(current_user)
		@properties = user_id.properties.order(sort_column2 + " " + sort_direction)
		#.order("created_at ASC")

		@bills = Bill.order(sort_column + " " + sort_direction)
	end

	def show
		@bills = Bill.all
		#if current_user.id != params[:id] then redirect_to root_path end
		if @property.user_id == current_user.id
			#..
		else
			return redirect_to root_path, :notice => "You dont have access to this property."

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
		if @property.user_id == current_user.id
			# ...
		else
			redirect_to root_path, :notice => "You dont have access to this property."
		end
	end

	def update
		if @property.update(property_params)
			redirect_to @property
		else
			render "edit"
		end
	end

	def destroy
		if @property.user_id == current_user.id
			
		else
			redirect_to root_path, :notice => "You dont have access to this property."
		end
		@property.destroy
		redirect_to @property
	end

    def fulladdress
		puts @property.address_one + "," + @property.state 
	end

	private

	def property_params
		params.require(:property).permit(:address_one, :address_two, :addresstype, :city, :state, :zip_code, :rent, :vacancy)
	end

	def find_property
		@property = Property.find(params[:id])
	end

	def signed_in_user
	    unless signed_in?
	        redirect_to root_path, :notice => "You must be logged in to view your properties."
    	end
    end

    def sort_column2
    	Property.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_column
    	Bill.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end

    def sort_direction
    	%w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end