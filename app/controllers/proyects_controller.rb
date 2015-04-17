class ProyectsController < ApplicationController
  before_action :find_proyect, except: [:index, :create]

  def index
    @proyects = Proyect.all
    render json: @proyects
  end

  def create
    @proyect = Proyect.new(proyect_params)
    @proyect.save

    render json: @proyect
  end

  def show
    render json: @proyect
  end

  def update
    @proyect.update(proyect_params)

    if @proyect.save
     render json: @proyect
    else
     render json: @proyect.errors, status: 422
    end
  end

  def show
    render json: @proyect
  end

  def update
    if @proyect.update(proyect_params)
     render json: @proyect
    else
      render json: @proyect.errors, status: 422
    end
  end

  def destroy
    @proyect.destroy
    head :no_content
  end

  rescue_from ActiveRecord::RecordNotFound do
    render json: {error: "record not found", status: 404}, status: 404
  end

  private
  def find_proyect
   @proyect = Proyect.find(params[:id])
  end

  def proyect_params
    params.require(:proyect).permit(:name, :description)
  end

end
