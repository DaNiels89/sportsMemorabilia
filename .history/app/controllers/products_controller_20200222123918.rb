# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new; end

  def create
    @product = Product.create(product_params)

    redirect_to @product
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.required(:product).permit(:name, :brand, :material, :size, :player, :price, :pic)
  end
end
