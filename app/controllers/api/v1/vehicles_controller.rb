class Api::V1::VehiclesController < ApplicationController
  before_action :set_vehicle, only: [ :show, :update, :destroy ]
  before_action :set_model, only: [ :index, :create ]


  def index
    # @model = Model.find(params[:model_id])
    @vehicles = Vehicle.where(model: @model)
    render :index
  end

  def show
    # @vehicle = Vehicle.find(params[:id])
    render :show

  end

  def update
    # @vehicle = Vehicle.find(params[:id])
    if @vehicle.update(vehicle_params)
      render :show
    else
      render_error
    end
  end

  def create
    # @model = Model.find(params[:model_id])
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.model = @model
    if @vehicle.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    head :no_content
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def set_model
    @model = Model.find(params[:model_id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:name, :legal_identifier, :frame_size, :status)
  end

  def render_error
    render json: { errors: @vehicle.errors.full_messages },
      status: :unprocessable_entity
  end

end
