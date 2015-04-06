class TicketsController < ApplicationController

	before_action :find_proyect
	before_action :find_ticket, except: [:index, :new, :create]

	def index
		@tickets = @proyect.tickets
	end

	def new
		@ticket = @proyect.tickets.new
	end

	def create
		@ticket = @proyect.tickets.create(params_ticket)
		@ticket.save

		redirect_to proyect_tickets_path
	end

	def edit
	end

	def show
	end

	def update					
		@ticket.update(params_ticket)

		redirect_to proyect_tickets_path(@ticket)
	end

	def destroy
		@ticket.destroy

		redirect_to proyect_tickets_path
	end

	private

	def find_proyect 
		@proyect = Proyect.find(params[:proyect_id])
	end

	def find_ticket
		@ticket = @proyect.tickets.find(params[:id])
	end

	def params_ticket
		params.require(:ticket).permit(:description, :name)
	end

end
