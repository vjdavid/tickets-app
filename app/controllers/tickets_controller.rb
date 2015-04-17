class TicketsController < ApplicationController
  before_action :find_proyect
  before_action :find_ticket, except: [:index, :create]

  def index
    @tickets = @proyect.tickets
    respond_with @tickets
  end

  def create
    @ticket = @proyect.tickets.create(params_ticket)
    @ticket.save
  end

  def show
    respond_with @ticket
  end

  def update
    @ticket.update(params_ticket)
  end

  def destroy
    @ticket.destroy
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
