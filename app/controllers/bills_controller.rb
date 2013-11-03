class BillsController < ApplicationController
	def index
		@bills = Bill.all
	end

	def create
		@bill = Bill.new(params[:bill])
	end

	def show
		@bill = Bill.find(params[:id])
	end

	def edit
		@bill = Bill.find(params[:id])
	end

	def update
		@bill = Bill.find(params[:id])
	end

	def destroy
		@bill = Bill.find(params[:id])
	    @bill.destroy
	    flash[:notice] = "Successfully destroyed cart."
	    redirect_to root_url
	end

	def status_paid
		@bill = Bill.find(params[:id])
		@bill.status = "says_paid"
	end

	def status_confirmed
		@bill = Bill.find(params[:id])
		@bill.status = "confirmed"
		redirect_to bills_url
	end
end
