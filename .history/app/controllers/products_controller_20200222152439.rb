# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.create(product_params)

    redirect_to @product
  end

  def update
    @product = Product.find(params[:id])
    @product = Product.update(product_params)

    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    redirect_to '/products'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.required(:product).permit(:name, :brand, :material, :size, :player, :price, :pic)
  end
end
