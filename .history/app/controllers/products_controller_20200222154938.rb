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
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to @product
      flash[:notice] = 'Memorabilia created'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Memorabilia creation failed'
  end

  if @post.save
    redirect_to @post
    flash[:notice] = 'Post created!'
    companies = Company.where(tag: @post.caption)
    companies.each do |company|
      UserMailer.new_post_email(company.user.email, @post).deliver_now
    end
  else
    redirect_back(failback_location: root_path)
    flash[:alert] = 'Post creation failed'
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
