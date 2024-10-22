class ProductsController < ApplicationController
  before_action :assign_resources

  def index
    @product = Product.active.first
  end

  def show
    @product = Product.active.find_by(id: params[:id])
    redirect_to root_path if @product.nil?
  end

  private

  def assign_resources
    @resources = Product.active.all
  end
end
