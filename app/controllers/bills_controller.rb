class BillsController < ApplicationController
	def index
		@bills = Bill.all
	end

	def create
		@bill = Bill.new(params[:bill], paid: false, amount: )
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
