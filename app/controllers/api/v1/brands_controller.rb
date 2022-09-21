class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: [ :show, :update, :destroy ]

  def index
    @brands = Brand.all
    render :index
  end

  def show
    # @brand
    # @brand = Brand.find(params[:id])
    # @model = @brand.models
    # render json: @model
    render :show
  end

  def update
    # @brand = Brand.find(params[:id])
    if @brand.update(brand_params)
      render :show
    else
      render_error
    end
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    # @brand = Brand.find(params[:id])
    @brand.destroy
    head :no_content
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end

  def render_error
    render json: { errors: @brand.errors.full_messages },
      status: :unprocessable_entity
  end
end
