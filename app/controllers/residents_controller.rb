class ResidentsController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :create, :new]
	before_action :find_resident, only: [:show, :edit, :update, :destroy]

	def index
		@current_user = current_user
		user_id = User.find(current_user)
		@all_resident = Resident.all
		#@current_user_residents = all_resident.where("user_id = '?'", current_user)
	end

	def show
		if @resident.user_id == current_user.id
			#..
		else
			return redirect_to root_path, :notice => "You dont have access to this page."

		end

		@bills = Bill.all
	end

	def new
		@resident = Resident.new
	end

	def create
		@resident = Resident.new(resident_params)
		@resident.user_id = current_user.id
		if @resident.save
			redirect_to @resident
		else
			render "new"
		end
	end

	def edit
		@residents = Resident.all
		if @resident.user_id == current_user.id
			# ...
		else
			redirect_to root_path, :notice => "You dont have access to this page."
		end
	end

	def update
		if @resident.update(resident_params)
			redirect_to @resident
		else
			render "edit"
		end
	end

	def destroy
		if @resident.user_id == current_user.id
			# ... 
		else
			redirect_to root_path, :notice => "You dont have access to this page."
		end
		@resident.destroy
		redirect_to @resident
	end


	private

	def resident_params
		params.require(:resident).permit(:name, :details, :user_id, :property_id)
	end

	def signed_in_user
	    unless signed_in?
	        redirect_to root_path, :notice => "You must be logged in to view your page."
    	end
    end

    def find_resident
		@resident = Resident.find(params[:id])
	end

end
