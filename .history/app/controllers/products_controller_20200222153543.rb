# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = Product.all
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.create(product_params)

    redirect_to @product
  end

  def update
    @product = Product.update(product_params)

    redirect_to @product
  end

  def destroy
    if current_user == @product.user
      @product.destroy
      redirect_to '/products'
      flash[:notice] = 'Post destroyed'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Not authorized to delete this memorabilia'
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.required(:product).permit(:name, :brand, :material, :size, :player, :price, :pic)
  end
end
