class BillsController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :create, :new]
	before_action :find_bill, only: [:show, :edit, :update, :destroy]

	def index
		user_id2 = User.find(current_user)
		all_bills = Bill.all
		@current_user_bills = all_bills.where("user_id = '?'", current_user)
		@bills = user_id2.bills.all
		overdue_bills = @bills.where("duedate <= '?'", Time.zone.now)
		unpaid_bills = @bills.where("status <= 'unpaid'")

		# user_id3 = Property.where(:user_id => current_user)
		# @properties = user_id3.properties
	end

	def show
		@properties = Property.all
		#if current_user.id != params[:id] then redirect_to root_path end
		if @bill.user_id == current_user.id
			#..
		else
			return redirect_to root_path, :notice => "You dont have access to this bill."

		end
	end

	def new
		@bill = Bill.new
	end

	def create
		@bill = Bill.new(bill_params)
		@bill.user_id = current_user.id
		if @bill.save
			redirect_to @bill
		else
			render "new"
		end
	end

	def edit
		@properties = Property.all
		if @bill.user_id == current_user.id
			# ...
		else
			redirect_to root_path, :notice => "You dont have access to this bill."
		end
	end

	def update
		if @bill.update(bill_params)
			redirect_to @bill
		else
			render "edit"
		end
	end

	def destroy
		if @bill.user_id == current_user.id
			
		else
			redirect_to root_path, :notice => "You dont have access to this bill."
		end
		@bill.destroy
		redirect_to @bill
	end

	private

	def bill_params
		params.require(:bill).permit(:property_id, :duedate, :amount, :billtype, :status, :description, :resident_id)
	end

	def find_bill
		@bill = Bill.find(params[:id])
	end

	def signed_in_user
	    unless signed_in?
	        redirect_to root_path, :notice => "You must be logged in to view your bills."
    	end
    end
end