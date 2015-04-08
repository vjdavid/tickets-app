class TicketsController < ApplicationController
  before_action :find_proyect
	before_action :find_ticket, except: [:index, :create]

  def index
    @tickets = @proyect.tickets
		render json: @tickets
	end

	def create
		@ticket = @proyect.tickets.create(params_ticket)

		if @ticket.save
			render json: @ticket, status: 201
		else
			render json: @ticket.errors, status: 400 
		end
	end

	def show
		render json: @ticket  
	end

	def update					
		if @ticket.update(params_ticket)
			render json: @ticket
		else
			render json: @ticket.errors, status: 400 
		end
	end

	def destroy
		@ticket.destroy
		head :no_content
	end

  rescue_from ActiveRecord::RecordNotFound do
	  render json: { error: "record not found", status: 404 }, status: 404
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
