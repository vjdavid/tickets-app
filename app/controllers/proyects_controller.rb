class ProyectsController < ApplicationController
	before_action :find_proyect, except: [:index, :create]

  def index
	  @proyects = Proyect.all
		respond_with @proyects
	end

  def create 
	  @proyect = Proyect.new(proyect_params)
		@proyect.save
		respond_with @proyect
	end

	def show
    respond_with @proyect
	end

	def update
	  @proyect.update(proyect_params)
		respond_with @proyect
	end

	def destroy
		@proyect.destroy
	end

	private	
	def find_proyect
		@proyect = Proyect.find(params[:id])
	end

	def proyect_params
		params.require(:proyect).permit(:name, :description)
	end	

end
