class BillsController < ApplicationController
	before_action :set_bill, only: [:create, :show, :edit, :update, :destroy, :status_paid]

	def index
		@bills = current_user.bills
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	    @bill.destroy
	    flash[:notice] = "Successfully destroyed cart."
	    redirect_to root_url
	end

	def status_paid
		@bill.status_paid
		redirect_to bills_path
	end

	private

		def set_bill
			@bill = Bill.find(params[:id])
		end

end
