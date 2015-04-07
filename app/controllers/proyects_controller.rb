class ProyectsController < ApplicationController
	before_action :find_proyect, only: [:show, :edit, :update, :destroy]

	def index
		@proyects = Proyect.all
		respond_with @proyects
	end

	def new
		@proyect = Proyect.new
	end
	
	def create 
		@proyect = Proyect.new(proyect_params)
		if @proyect.save
		 flash[:notice] = "Project successfully created"
		 redirect_to @proyect
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		@proyect.update(params_ticket)

		redirect_to ticket_path(@proyect)
	end

	def destroy
		@proyect.destroy

		redirect_to proyects_path
	end

	private	

	def find_proyect
		@proyect = Proyect.find(params[:id])
	end

	def proyect_params
		params.require(:proyect).permit(:name, :description)
	end	

end
