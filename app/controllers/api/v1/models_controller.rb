class Api::V1::ModelsController < ApplicationController
  before_action :set_model, only: [ :show, :update, :destroy ]
  before_action :set_brand, only: [ :index, :create ]

  def index
    # @brand = Brand.find(params[:brand_id])
    @models = Model.where(brand: @brand)
    render :index
  end

  def show
    # @model = Model.find(params[:id])
    # @model
    render :show
  end

  def update
    # @model = Model.find(params[:id])
    if @model.update(model_params)
      render :show
    else
      render_error
    end
  end

  def create
    # @brand = Brand.find(params[:brand_id])
    @model = Model.new(model_params)
    @model.brand = @brand
    if @model.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    # @model = Model.find(params[:id])
    @model.destroy
    head :no_content
  end

  private

  def set_model
    @model = Model.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:brand_id])
  end

  def model_params
    params.require(:model).permit(:name)
  end

  def render_error
    render json: { errors: @model.errors.full_messages },
      status: :unprocessable_entity
  end
end
